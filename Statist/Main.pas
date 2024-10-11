unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.ControlList, Vcl.VirtualImage, Vcl.WinXPanels, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdServerIOHandler,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  System.Actions, Vcl.ActnList, Vcl.StdActns, clipbrd, JSON, System.RegularExpressions, XmlIntf, XmlDoc;

type
  TFormMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PanelForms: TPanel;
    EditFormsFind: TEdit;
    ListBoxForms: TListBox;
    CheckBoxFormsFullName: TCheckBox;
    ScrollBoxForms: TScrollBox;
    LabelFormName: TLabel;
    LabelFormFullName: TLabel;
    EditFormFullName: TEdit;
    MemoFormFullName: TMemo;
    EditFormPeriod: TEdit;
    EditFormOKUD: TEdit;
    LabelFormPeriod: TLabel;
    LabelFormOKUD: TLabel;
    LabelFormSrok: TLabel;
    MemoFormSrok: TMemo;
    EditFormFill: TEdit;
    LinkLabelFormVersion: TLinkLabel;
    LinkLabelFormFill: TLinkLabel;
    EditFormYtv: TEdit;
    LinkLabelFormYtv: TLinkLabel;
    IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL;
    PanelFormDownload: TPanel;
    ShapeFormXml: TShape;
    LabelFormXML: TLabel;
    LabelFormDoc: TLabel;
    ShapeFormDoc: TShape;
    LabelFormPdf: TLabel;
    ShapeFormPdf: TShape;
    PopupMenuLinks: TPopupMenu;
    NLinksCopyToClipboard: TMenuItem;
    PanelFormContent: TPanel;
    PanelFormControl: TPanel;
    ButtonUpdateForms: TButton;
    procedure NLinksCopyToClipboardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonUpdateFormsClick(Sender: TObject);
  private
    { Private declarations }
    procedure loadForms();
    procedure printData(shortName, longName, XMLLink, DOCLink, PDFLink, period, srok, DateYtv: String);
    procedure SplitByMultipleSpaces(const Input: string; List: TStringList);
    function formatText(inputText, firstPos, lastPos: String):String;
    function JSONUnescape(const Source: string; CRLF: string = #13#10): string;
    procedure createRecord(title, XMLLink, DOCLink, PDFLink, longName, dateYtv: String);
    procedure writeToDB(shortName, longName, period, Okud, srok, dateYtv, DateYtvLink, XMLLink, DOCLink, PDFLink: String);
    function parseXML(fileLink: string): String;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses DM;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;

  DataModule1.FDConRosstatForm.Open();
  DataModule1.FDTableForms.Open();
end;

// Загрузка форм
procedure TFormMain.loadForms();
var HTTP: TIdHTTP;
    SSL:TIdSSLIOHandlerSocketOpenSSL;
    pageCount, temp, formsCounter: Integer;
    pageRosstat, currentPage, nextPage, htmlDoc: String;
    RegExDateYtv, RegExDateYtvLink: TRegEx;
    JSONPage: TJSONObject;
    Parts: TStringList;
    forms: array of TStringList;
    XMLLink, DOCLink, PDFLink, shortName, longName, period, srok, Okud, DateYtv, DateYtvLink: String;
    XMLPos, DOCPos, PDFPos, shortNamePos, longNamePos, periodPos, srokPos, OkudPos, DateYtvPos: Integer;
begin
  HTTP := TIdHTTP.Create(nil);
  HTTP.HandleRedirects:=True;
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(HTTP);
  HTTP.IOHandler := SSL;
  SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions - [sslvTLSv1];
  SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions + [sslvTLSv1_2];
  pageCount := 0;
  try
    nextPage := '0';
    RegExDateYtv := TRegEx.Create('\<a href\=\".*?\>');
    RegExDateYtvLink := TRegEx.Create('\/storage.*\"');

    while TryStrToInt(nextPage, temp) do begin
      inc(pageCount);
      pageRosstat := HTTP.Get('https://rosstat.gov.ru/monitoring/getPage?page='+IntToStr(pageCount)+'&query=&year=2024&heading=');
      JSONPage :=TJSONObject.Create;
      JSONPage.Parse(TEncoding.UTF8.GetBytes(pageRosstat),0);
      JSONPage.TryGetValue('nextPage', nextPage);
      JSONPage.TryGetValue('currentPage', currentPage);
      JSONPage.TryGetValue('html', htmlDoc);

      htmlDoc := JSONUnescape(htmlDoc);
      htmlDoc := TRegEx.Replace(htmlDoc, '\s{2,3}', ' ');

      Parts := TStringList.Create;
      SplitByMultipleSpaces(htmlDoc, Parts);
      formsCounter := 0;
      for var i := 0 to Parts.Count - 1 do begin
        if Parts[i] = '<div class="list__item">' then begin
          inc(formsCounter);
          setLength(forms,formsCounter);
          forms[formsCounter-1] := TStringList.Create;
        end;
        forms[formsCounter-1].Add(Parts[i]);
      end;

      for var i := 0 to formsCounter-1 do begin
        longName := ''; XMLLink := ''; DOCLink := ''; PDFLink := ''; shortName := ''; Okud := ''; DateYtv := ''; DateYtvLink := '';
        longNamePos := 0;
        XMLPos := 0;
        DOCPos := 0;
        PDFPos := 0;
        shortNamePos := 0;
        longNamePos := 0;
        periodPos := 0;
        srokPos := 0;
        OkudPos := 0;
        DateYtvPos := 0;

        for var j := 0 to forms[i].Count-1 do begin
          if AnsiPos('<div class="toggle-card__title">', forms[i].Strings[j]) > 0 then longNamePos := j;
          if (AnsiPos('<a class="btn btn-icon btn-white btn-br"', forms[i].Strings[j]) > 0) and (AnsiPos('.xml', forms[i].Strings[j]) > 0) then XMLPos := j;
          if (AnsiPos('<a class="btn btn-icon btn-white btn-br"', forms[i].Strings[j]) > 0) and (AnsiPos('.doc', forms[i].Strings[j]) > 0) then DOCPos := j;
          if (AnsiPos('<a class="btn btn-icon btn-white btn-br"', forms[i].Strings[j]) > 0) and (AnsiPos('.pdf', forms[i].Strings[j]) > 0) then PDFPos := j;
          if AnsiPos('<div>Индекс формы</div>', forms[i].Strings[j]) > 0 then shortNamePos := j+1;
          if AnsiPos('<div>Периодичность</div>', forms[i].Strings[j]) > 0 then periodPos := j+1;
          if AnsiPos('<div>Срок сдачи формы</div>', forms[i].Strings[j]) > 0 then srokPos := j+1;
          if AnsiPos('<div>Дата и номер приказа об утверждении формы</div>', forms[i].Strings[j]) > 0 then DateYtvPos := j+2;
          if AnsiPos('<div>Код формы по ОКУД</div>', forms[i].Strings[j]) > 0 then OkudPos := j+1;
        end;
        if longNamePos > 0 then longName := formatText(forms[i].Strings[longNamePos], '<div class="toggle-card__title">', '</div>');
        if shortNamePos > 0 then shortName := formatText(forms[i].Strings[shortNamePos], '<div>', '</div>');
        if XMLPos > 0 then XMLLink := formatText(forms[i].Strings[XMLPos], '<a class="btn btn-icon btn-white btn-br" href="', '" download>');
        if DOCPos > 0 then DOCLink := formatText(forms[i].Strings[DOCPos], '<a class="btn btn-icon btn-white btn-br" href="', '" download>');
        if PDFPos > 0 then PDFLink := formatText(forms[i].Strings[PDFPos], '<a class="btn btn-icon btn-white btn-br" href="', '" download>');
        if periodPos > 0 then period := formatText(forms[i].Strings[periodPos], '<div><p>', '</p></div>');
        if srokPos > 0 then srok := formatText(forms[i].Strings[srokPos], '<div>', '</div>');
        if DateYtvPos > 0 then begin
          DateYtv := forms[i].Strings[DateYtvPos];
          DateYtvLink := RegExDateYtvLink.Match(DateYtv).Groups[0].value;
          DateYtvLink := Copy(DateYtvLink, 1, Length(DateYtvLink)-1);
          DateYtv := formatText(forms[i].Strings[DateYtvPos], RegExDateYtv.Match(DateYtv).Groups[0].value, '</a>');
        end;
        if OkudPos > 0 then Okud := formatText(forms[i].Strings[OkudPos], '<div>', '</div>');
        // createRecord(shortName, XMLLink, DOCLink, PDFLink, longName, DateYtv);
        writeToDB(shortName, longName, period, Okud, srok, DateYtv, DateYtvLink, XMLLink, DOCLink, PDFLink);
      end;
      JSONPage.Free;
      //printData(shortName, longName, XMLLink, DOCLink, PDFLink, period, srok, DateYtv);
    end;
  finally
    SSL.Free;
    HTTP.Free;
  end;

  //test := HTTP.Get('https://rosstat.gov.ru/monitoring/getPage?page=1&query=&year=2024&heading=');
  //showMessage(IntToStr(Http.ResponseCode));
end;

procedure TFormMain.writeToDB(shortName, longName, period, Okud, srok, dateYtv, DateYtvLink, XMLLink, DOCLink, PDFLink: String);
begin
  try
    DataModule1.FDQueryForms.SQL.Text := 'Insert into Forms (shortName, fullName, period, Okud, srok, ytvDate, ytvLink, xmlLink, xmlDate, docLink, pdfLink) Values (:Value1, :Value2, :Value3, :Value4, :Value5, :Value6, :Value7, :Value8, :Value9, :Value10, :Value11)';
    DataModule1.FDQueryForms.ParamByName('Value1').AsString := shortName;
    DataModule1.FDQueryForms.ParamByName('Value2').AsString := longName;
    DataModule1.FDQueryForms.ParamByName('Value3').AsString := period;
    DataModule1.FDQueryForms.ParamByName('Value4').AsString := Okud;
    DataModule1.FDQueryForms.ParamByName('Value5').AsString := srok;
    DataModule1.FDQueryForms.ParamByName('Value6').AsString := dateYtv;
    if length(dateYtvLink) > 0 then DataModule1.FDQueryForms.ParamByName('Value7').AsString := 'https://rosstat.gov.ru' + dateYtvLink;
    if length(XMLLink) > 0 then DataModule1.FDQueryForms.ParamByName('Value8').AsString := 'https://rosstat.gov.ru' + XMLLink;
    if length(XMLLink) > 0 then DataModule1.FDQueryForms.ParamByName('Value9').AsString := parseXML('https://rosstat.gov.ru' + XMLLink);
    if length(DOCLink) > 0 then DataModule1.FDQueryForms.ParamByName('Value10').AsString := 'https://rosstat.gov.ru' + DOCLink;
    if length(PDFLink) > 0 then DataModule1.FDQueryForms.ParamByName('Value11').AsString := 'https://rosstat.gov.ru' + PDFLink;
    DataModule1.FDQueryForms.ExecSQL;
  finally
    DataModule1.FDQueryForms.Close;
  end;
end;

procedure TFormMain.printData(shortName, longName, XMLLink, DOCLink, PDFLink, period, srok, DateYtv: String);
begin
  LabelFormName.Caption := shortName;
  EditFormFullName.Text := longName;
  LabelFormXML.Hint := XMLLink;
  LabelFormDoc.Hint := DOCLink;
  LabelFormPdf.Hint := PDFLink;
  EditFormPeriod.Text := period;
  MemoFormSrok.Text := srok;
  EditFormYtv.Text := DateYtv;
end;

procedure TFormMain.ButtonUpdateFormsClick(Sender: TObject);
begin
  loadForms;
end;

procedure TFormMain.createRecord(title, XMLLink, DOCLink, PDFLink, longName, dateYtv: String);
begin
    ListBoxForms.Items.Add(title);
end;

procedure TFormMain.NLinksCopyToClipboardClick(Sender: TObject);
begin
  Clipboard.AsText := (((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent as TLabel).hint;
end;

function TFormMain.parseXML(fileLink: string): String;
var XMLDoc: IXMLDocument;
    XMLNode: IXMLNode;
    xmlFile: TMemoryStream;

    HTTP: TIdHTTP;
    SSL:TIdSSLIOHandlerSocketOpenSSL;
begin
  HTTP := TIdHTTP.Create(nil);
  HTTP.HandleRedirects:=True;
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(HTTP);
  HTTP.IOHandler := SSL;
  SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions - [sslvTLSv1];
  SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions + [sslvTLSv1_2];
  XMLDoc := TXMLDocument.Create(nil);
  xmlFile := TMemoryStream.Create();
  try
    try
      HTTP.Get(fileLink, xmlFile);
      XMLDoc.LoadFromStream(xmlFile);
      XMLDoc.Active := True;
      parseXML := XMLDoc.ChildNodes['metaForm'].AttributeNodes['version'].Text;
    except on e: Exception do ShowMessage(e.Message);
    end;
  finally
    xmlFile.Free;
    SSL.Free;
    HTTP.Free;
  end;
end;

// Удаление пробелов и перенос строк
procedure TFormMain.SplitByMultipleSpaces(const Input: string; List: TStringList);
var
  Matches: TMatchCollection;
  Match: TMatch;
  LastIndex, StartIndex: Integer;
begin
  List.Clear;
  Matches := TRegEx.Matches(Input, '\s{2,}'); // Ищем последовательности из двух или более пробелов
  LastIndex := 1;
  for Match in Matches do
  begin
    StartIndex := Match.Index;
    List.Add(Copy(Input, LastIndex, StartIndex - LastIndex));
    LastIndex := StartIndex + Match.Length;
  end;
  if LastIndex <= Length(Input) then
    List.Add(Copy(Input, LastIndex, MaxInt));
end;

// Форматирование данных их HTML
function TFormMain.formatText(inputText, firstPos, lastPos: String):String;
var text: String;
    firstPosCount: Integer;
begin
  text:= inputText;
  Delete(text, 1, Length(firstPos));
  firstPosCount := AnsiPos(lastPos, text);
  Delete(text, firstPosCount, Length(text)-1);
  formatText := text;
end;

// Юникод декодер
function TFormMain.JSONUnescape(const Source: string; CRLF: string = #13#10): string;
const
  ESCAPE_CHAR = '\';
  QUOTE_CHAR = '"';
  EXCEPTION_FMT = 'Invalid escape at position %d';
var
  EscapeCharPos, TempPos: Integer;
  Temp: string;
  IsQuotedString: Boolean;
begin
  result := '';
  IsQuotedString := (Source[1] = QUOTE_CHAR) and
    (Source[Length(Source)] = QUOTE_CHAR);
  EscapeCharPos := Pos(ESCAPE_CHAR, Source);
  TempPos := 1;
  while EscapeCharPos > 0 do
  begin
    result := result + Copy(Source, TempPos, EscapeCharPos - TempPos);
    TempPos := EscapeCharPos;
    if EscapeCharPos < Length(Source) - Integer(IsQuotedString) then
      case Source[EscapeCharPos + 1] of
        't':
          Temp := #9;
        'n':
          Temp := CRLF;
        '\':
          Temp := '\';
        '"':
          Temp := '"';
        'u':
          begin
            if EscapeCharPos + 4 < Length(Source) - Integer(IsQuotedString) then
              Temp := Chr(StrToInt('$' + Copy(Source, EscapeCharPos + 2, 4)))
            else
              raise Exception.Create(Format(EXCEPTION_FMT, [EscapeCharPos]));
            Inc(TempPos, 4);
          end;
      else
        raise Exception.Create(Format(EXCEPTION_FMT, [EscapeCharPos]));
      end
    else
      raise Exception.Create(Format(EXCEPTION_FMT, [EscapeCharPos]));
    Inc(TempPos, 2);
    result := result + Temp;
    EscapeCharPos := Pos(ESCAPE_CHAR, Source, TempPos);
  end;
  result := result + Copy(Source, TempPos, Length(Source) - TempPos + 1);
end;

end.

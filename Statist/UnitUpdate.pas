unit UnitUpdate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Samples.Spin, Vcl.CheckLst, Vcl.Grids, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdServerIOHandler, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Json, System.RegularExpressions, System.Generics.Collections,
  Vcl.Menus;

type
  TFormUpdate = class(TForm)
    PageControlUpdate: TPageControl;
    MemoMsg: TMemo;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PanelControl: TPanel;
    PanelForms: TPanel;
    GroupBoxForms: TGroupBox;
    PanelFormsHeader: TPanel;
    CheckBoxSelectAllForms: TCheckBox;
    EditFindForm: TEdit;
    SpinButtonChangeRecord: TSpinButton;
    CheckListBoxForms: TCheckListBox;
    ButtonCheckForms: TButton;
    ButtonForceUpdate: TButton;
    LabelRecordCount: TLabel;
    CheckBoxForceUpdate: TCheckBox;
    LabelUpdateHelp1: TLabel;
    Label1: TLabel;
    PanelActual: TPanel;
    LabelActualCount: TLabel;
    StringGridActualForms: TStringGrid;
    PanelActualControl: TPanel;
    ButtonUpdate: TButton;
    ButtonBack: TButton;
    ButtonForward: TButton;
    IdHTTP1: TIdHTTP;
    IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL;
    SSL: TIdSSLIOHandlerSocketOpenSSL;
    PopupMenuClearMsg: TPopupMenu;
    NClearMsg: TMenuItem;
    procedure EditFindFormChange(Sender: TObject);
    procedure SpinButtonChangeRecordDownClick(Sender: TObject);
    procedure SpinButtonChangeRecordUpClick(Sender: TObject);
    procedure CheckBoxSelectAllFormsClick(Sender: TObject);
    procedure CheckBoxForceUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonBackClick(Sender: TObject);
    procedure ButtonForceUpdateClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonCheckFormsClick(Sender: TObject);
    procedure NClearMsgClick(Sender: TObject);
  private
    { Private declarations }
    var findRecordsInUpdate: array of Integer;
    function checkVersionForm(formLink: string): String;
    procedure loadAllForms();
  public
    { Public declarations }
  end;

var
  FormUpdate: TFormUpdate;

implementation

{$R *.dfm}

uses DM, UnitFormUtils;

procedure TFormUpdate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Destroy;
  FormUpdate := nil;
end;

procedure TFormUpdate.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=MessageBox(handle,pchar('Закрыть мастер обновления форм?'),pchar('Закрытие мастера'),36)=IDYes
end;

procedure TFormUpdate.FormCreate(Sender: TObject);
begin
  if CheckListBoxForms.Count <= 0 then begin
    var i := 0;

    DataModule1.FDQueryForms.SQL.Text := 'select * from Forms';
    DataModule1.FDQueryForms.Open();
    CheckListBoxForms.Items.BeginUpdate;
    while not DataModule1.FDQueryForms.Eof do begin
      CheckListBoxForms.Items.Add(DataModule1.FDQueryForms.FieldByName('shortName').AsString);
      DataModule1.FDQueryForms.Next;
      inc(i);
    end;
    CheckListBoxForms.Items.EndUpdate;
    DataModule1.FDQueryForms.Close;
  end;
  FormUpdate.PageControlUpdate.ActivePageIndex := -1;
  FormUpdate.PageControlUpdate.SelectNextPage(true, false);

  StringGridActualForms.Cells[0,0] := 'Форма';
  StringGridActualForms.Cells[1,0] := 'ОКУД';
  StringGridActualForms.Cells[2,0] := 'Старая версия';
  StringGridActualForms.Cells[3,0] := 'Новая версия';
end;

// Перемещение между вкладками
procedure TFormUpdate.ButtonBackClick(Sender: TObject);
begin
  PageControlUpdate.SelectNextPage(true, false);
end;

// Включить возможность принудительного обновления
procedure TFormUpdate.CheckBoxForceUpdateClick(Sender: TObject);
begin
  if Application.MessageBox(pChar('Включить возможность принудительного обновления? Такое обновление очистит всю базу данных и займет какое то время на добавление'), 'Включение принудительного обновления', MB_YESNO) = idYes then begin
    ButtonForceUpdate.Enabled := CheckBoxForceUpdate.Checked;
    PanelControl.SetFocus;
  end;
end;

 // Выбрать все формы в обновлении
procedure TFormUpdate.CheckBoxSelectAllFormsClick(Sender: TObject);
begin
  CheckListBoxForms.CheckAll(CheckBoxSelectAllForms.State);
end;

// Поиск по формам
procedure TFormUpdate.EditFindFormChange(Sender: TObject);
begin
  if Length(EditFindForm.Text) = 0 then begin
    LabelRecordCount.Caption := '';
    SpinButtonChangeRecord.Enabled := false;
  end else begin

    setLength(findRecordsInUpdate, 0);
    for var i := 0 to CheckListBoxForms.Count-1 do begin
      if Pos(EditFindForm.Text, CheckListBoxForms.Items[i]) > 0 then begin
        setLength(findRecordsInUpdate, Length(findRecordsInUpdate)+1);
        findRecordsInUpdate[Length(findRecordsInUpdate)-1] := i;
      end;
    end;

    if Length(findRecordsInUpdate) > 0 then begin
      LabelRecordCount.Caption := ' 1 / ' + Length(findRecordsInUpdate).ToString;
      CheckListBoxForms.Selected[findRecordsInUpdate[0]] := true;
    end;
    SpinButtonChangeRecord.Enabled := true;
  end;
end;

// Перемещение между найденными записями в Обновлении - вниз
procedure TFormUpdate.SpinButtonChangeRecordDownClick(Sender: TObject);
var currentRecord, recordsCount: String;
begin
  currentRecord := LabelRecordCount.Caption;
  recordsCount := LabelRecordCount.Caption;

  Delete(currentRecord, Pos(' / ', currentRecord), length(currentRecord));
  Delete(recordsCount, 1, Pos(' / ', recordsCount)+1);

  if StrToInt(currentRecord) < StrToInt(recordsCount) then begin
    currentRecord := IntToStr(StrToInt(currentRecord)+1);
    LabelRecordCount.Caption := ' ' + currentRecord + ' /' + recordsCount;
    CheckListBoxForms.Selected[findRecordsInUpdate[StrToInt(currentRecord)-1]] := true;
  end;
end;

// Перемещение между найденными записями в Обновлении - наверх
procedure TFormUpdate.SpinButtonChangeRecordUpClick(Sender: TObject);
var currentRecord, recordsCount: String;
begin
  currentRecord := LabelRecordCount.Caption;
  recordsCount := LabelRecordCount.Caption;

  Delete(currentRecord, Pos(' / ', currentRecord), length(currentRecord));
  Delete(recordsCount, 1, Pos(' / ', recordsCount)+1);

  if StrToInt(currentRecord) > 1 then begin
    currentRecord := IntToStr(StrToInt(currentRecord)-1);
    LabelRecordCount.Caption := ' ' + currentRecord + ' /' + recordsCount;
    CheckListBoxForms.Selected[findRecordsInUpdate[StrToInt(currentRecord)-1]] := true;
  end;
end;

// Проверка актуальности выбранных форм
procedure TFormUpdate.ButtonCheckFormsClick(Sender: TObject);
var okud, oldVersion, newVersion: string;
    findCounter: integer;
begin
  StringGridActualForms.RowCount := 2;
  StringGridActualForms.Cells[0,1] := '';
  StringGridActualForms.Cells[1,1] := '';
  StringGridActualForms.Cells[2,1] := '';
  StringGridActualForms.Cells[3,1] := '';

  if Application.MessageBox(pChar('Проверить отмеченные формы?'), 'Проверка актуальности', MB_YESNO) = idYes then begin
    ButtonBackClick(Sender);
    findCounter := 0;
    MemoMsg.Lines.Add('[' + DateTimeToStr(Now) + '] ' + 'Начало проверки актуальности');
    for var i := 0 to CheckListBoxForms.Count-1 do begin
      if CheckListBoxForms.Checked[i] then begin
        DataModule1.FDQueryForms.SQL.Text := 'Select okud, xmlDate from Forms where shortName = ' + '''' + CheckListBoxForms.Items[i] + '''';
        MemoMsg.Lines.Add('[' + DateTimeToStr(Now) + '] ' + 'Проверяется ' + CheckListBoxForms.Items[i] + '...');
        DataModule1.FDQueryForms.Open;
        okud := DataModule1.FDQueryForms.FieldByName('okud').AsString;
        oldVersion := DataModule1.FDQueryForms.FieldByName('xmlDate').AsString;
        newVersion := checkVersionForm('https://rosstat.gov.ru/monitoring/getPage?query='+ okud +'&heading=&year=2024&page=1');

        if (length(oldVersion) > 0) and (length(newVersion) > 0) then begin
          if StrToDate(newVersion) > StrToDate(oldVersion) then begin
            MemoMsg.Lines[MemoMsg.Lines.Count-1] := MemoMsg.Lines[MemoMsg.Lines.Count-1] + ' Требуется обновление';
            inc(findCounter);
            StringGridActualForms.Cells[0, StringGridActualForms.RowCount-1] := CheckListBoxForms.Items[i];
            StringGridActualForms.Cells[1, StringGridActualForms.RowCount-1] := okud;
            StringGridActualForms.Cells[2, StringGridActualForms.RowCount-1] := oldVersion;
            StringGridActualForms.Cells[3, StringGridActualForms.RowCount-1] := newVersion;
            StringGridActualForms.RowCount := StringGridActualForms.RowCount + 1;
          end else MemoMsg.Lines[MemoMsg.Lines.Count-1] := MemoMsg.Lines[MemoMsg.Lines.Count-1] + ' Актуальна';
        end;
      end;
    end;
    MemoMsg.Lines.Add('[' + DateTimeToStr(Now) + '] ' + 'Актуальность форм проверена');
    if findCounter > 0 then begin
      StringGridActualForms.RowCount := StringGridActualForms.RowCount - 1;
      ButtonForward.Visible := True;
      LabelActualCount.Caption := 'Найдено форм к обновлению: ' + IntToStr(findCounter);
    end;
  end;
end;

// Получение актуальной версии формы
function TFormUpdate.checkVersionForm(formLink: string): String;
var HTTP: TIdHTTP;
    JSONPage: TJSONObject;
    pageRosstat, htmlDoc, XMLLink: string;
    Parts: TStringList;
    XMLPos: integer;
begin
  HTTP := TIdHTTP.Create(nil);
  HTTP.HandleRedirects:=True;
  HTTP.IOHandler := SSL;
  try
    try
      pageRosstat := HTTP.Get(formLink);
      JSONPage :=TJSONObject.Create;
      JSONPage.Parse(TEncoding.UTF8.GetBytes(pageRosstat),0);
      JSONPage.TryGetValue('html', htmlDoc);
      htmlDoc := UnitFormUtils.JSONUnescape(htmlDoc);
      htmlDoc := TRegEx.Replace(htmlDoc, '\s{2,3}', ' ');
      Parts := TStringList.Create;
      UnitFormUtils.SplitByMultipleSpaces(htmlDoc, Parts);
      XMLPos:= 0;
      for var i := 0 to Parts.Count-1 do begin
        if (AnsiPos('<a class="btn btn-icon btn-white btn-br"', Parts[i]) > 0) and (AnsiPos('.xml', Parts[i]) > 0) then begin
          XMLPos := i;
          break;
        end;
      end;
      if XMLPos > 0 then XMLLink := formatText(Parts[XMLPos], '<a class="btn btn-icon btn-white btn-br" href="', '" download>');

      var keyList := TStringList.Create;
      keyList.Add('version');
      var xmlDict := TDictionary<String, String>.Create();
      try
        try
          xmlDict := parseXML('https://rosstat.gov.ru' + XMLLink, keyList);
          var versionForm := xmlDict.Items['version'];
          checkVersionForm := StringReplace(versionForm, '-', '.', [rfReplaceAll]);

        except on e: Exception do MemoMsg.Lines.Add('[' + DateTimeToStr(Now) + ']' + e.Message);
        end;
      finally
        keyList.Free;
        xmlDict.Free;
      end;
    except on e:Exception do MemoMsg.Lines.Add('[' + DateTimeToStr(Now) + ']' + e.Message);

    end;
  finally
    HTTP.Free;
  end;
end;

// Принудительнное обновление
procedure TFormUpdate.ButtonForceUpdateClick(Sender: TObject);
var HTTP: TIdHTTP;
begin
  if Application.MessageBox(pChar('Обновить все формы принудительно? Данные базы данных очистяться!'), 'Обновление форм', MB_YESNO) = idYes then begin
      HTTP := TIdHTTP.Create(nil);
      HTTP.HandleRedirects:=True;
      HTTP.IOHandler := SSL;
      try
        try
          HTTP.Get('https://rosstat.gov.ru/monitoring/getPage?page=1&query=&year=2024&heading=');
          if HTTP.ResponseCode = 200 then begin
            DataModule1.FDTableForms.Close();
            MemoMsg.Lines.Add('[' + DateTimeToStr(Now) + '] Начало обновления');
            DataModule1.clearDB;
            loadAllForms;
            DataModule1.FDTableForms.Open();
            MemoMsg.Lines.Add('[' + DateTimeToStr(Now) + '] Обновление завершено');
          end;
        except  on e: EIdHTTPProtocolException do MemoMsg.Lines.Add('[' + DateTimeToStr(Now) + '] [HTTP code ' + intToStr(HTTP.ResponseCode) + '] ' + e.Message);
                on e: Exception do MemoMsg.Lines.Add('[' + DateTimeToStr(Now) + '] ' + e.Message);
        end;
      finally
        HTTP.Free;
      end;
  end;
end;

// Загрузка всех форм
procedure TFormUpdate.loadAllForms();
var pageCount, temp, formsCounter: Integer;
    pageRosstat, currentPage, nextPage, htmlDoc: String;
    RegExDateYtv, RegExDateYtvLink: TRegEx;
    JSONPage: TJSONObject;
    Parts: TStringList;
    forms: array of TStringList;
    XMLLink, DOCLink, PDFLink, shortName, longName, period, srok, Okud, DateYtv, DateYtvLink: String;
    XMLPos, DOCPos, PDFPos, shortNamePos, longNamePos, periodPos, srokPos, OkudPos, DateYtvPos: Integer;

    HTTP: TIdHTTP;
begin
  HTTP := TIdHTTP.Create(nil);
  HTTP.HandleRedirects:=True;
  HTTP.IOHandler := SSL;
  pageCount := 0;
  try
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

      htmlDoc := UnitFormUtils.JSONUnescape(htmlDoc);
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
        MemoMsg.Lines.Add('[' + DateTimeToStr(Now) + '] Обработка формы ' + shortName + '...');
        Application.ProcessMessages;
        try
          DataModule1.writeToDB(shortName, longName, period, Okud, srok, dateYtv, DateYtvLink, XMLLink, DOCLink, PDFLink);
        except on e:Exception do MemoMsg.Lines.Add('[' + DateTimeToStr(Now) + ']' + e.Message);
        end;

        MemoMsg.Lines.Add('[' + DateTimeToStr(Now) + '] Скачивание формы ' + shortName + '...');
        try
        downloadFile('https://rosstat.gov.ru'+XMLLink, ExtractFilePath(Application.ExeName) + 'files\xml\', shortName, '.xml');
        except on E:EIdHTTPProtocolException do MemoMsg.Lines.Add('Ошибка при скачивании');
             on E: Exception do MemoMsg.Lines.Add('Ошибка при скачивании');
        end;

      end;
      JSONPage.Free;
    end;
  except on e:Exception do MemoMsg.Lines.Add('[' + DateTimeToStr(Now) + ']' + e.Message);

  end;
  finally
    HTTP.Free;
  end;

  //test := HTTP.Get('https://rosstat.gov.ru/monitoring/getPage?page=1&query=&year=2024&heading=');
  //showMessage(IntToStr(Http.ResponseCode));
end;

// Очистить логи
procedure TFormUpdate.NClearMsgClick(Sender: TObject);
begin
  (((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent as TMemo).Lines.Clear;
end;

end.

unit UnitUpdate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Samples.Spin, Vcl.CheckLst, Vcl.Grids, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdServerIOHandler, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Json, System.RegularExpressions, System.Generics.Collections;

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
    ButtonCheckActual: TButton;
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
    procedure EditFindFormChange(Sender: TObject);
    procedure SpinButtonChangeRecordDownClick(Sender: TObject);
    procedure SpinButtonChangeRecordUpClick(Sender: TObject);
    procedure CheckBoxSelectAllFormsClick(Sender: TObject);
    procedure CheckBoxForceUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonBackClick(Sender: TObject);
  private
    { Private declarations }
    var findRecordsInUpdate: array of Integer;
    procedure ButtonCheckFormsClick(Sender: TObject);
    function checkVersionForm(formLink: string): String;
  public
    { Public declarations }
  end;

var
  FormUpdate: TFormUpdate;

implementation

{$R *.dfm}

uses DM, UnitFormUtils;

procedure TFormUpdate.FormCreate(Sender: TObject);
begin
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

procedure TFormUpdate.ButtonCheckFormsClick(Sender: TObject);
var okud, oldVersion, newVersion: string;
    findCounter: integer;
begin
  StringGridActualForms.RowCount := 2;
  StringGridActualForms.Cells[0,1] := '';
  StringGridActualForms.Cells[1,1] := '';
  StringGridActualForms.Cells[2,1] := '';
  StringGridActualForms.Cells[3,1] := '';

  PanelControl.SetFocus;
  if Application.MessageBox(pChar('Проверить отмеченные формы?'), 'Проверка актуальности', MB_YESNO) = idYes then begin
    PageControlUpdate.SelectNextPage(true, false);
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
    except on e:Exception do showMessage('hui');

    end;
  finally
    HTTP.Free;
  end;
end;

end.

unit UnitUpdate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Samples.Spin, Vcl.CheckLst, Vcl.Grids;

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
  public
    { Public declarations }
  end;

var
  FormUpdate: TFormUpdate;

implementation

{$R *.dfm}

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

end.

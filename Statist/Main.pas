unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.ControlList, Vcl.VirtualImage, Vcl.WinXPanels, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdServerIOHandler,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  System.Actions, Vcl.ActnList, Vcl.StdActns, clipbrd, JSON, System.RegularExpressions, XmlIntf, XmlDoc,
  Data.DB, Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList, Vcl.CheckLst,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask, Vcl.Imaging.pngimage, Vcl.Samples.Spin,
  Vcl.ExtActns, shellApi, NetEncoding, Vcl.WinXCtrls, Vcl.WinXCalendars, System.IOUtils, System.Types;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState); override;
  end;

type
  TFormMain = class(TForm)
    PageControlMain: TPageControl;
    TabSheetForms: TTabSheet;
    TabSheetOrganization: TTabSheet;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PanelForms: TPanel;
    EditFormsFind: TEdit;
    ScrollBoxForms: TScrollBox;
    LabelFormFullName: TLabel;
    LabelFormPeriod: TLabel;
    LabelFormOKUD: TLabel;
    LabelFormSrok: TLabel;
    LinkLabelFormFill: TLinkLabel;
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
    PanelFormInfo: TPanel;
    PanelFormControl: TPanel;
    ButtonUpdateForms: TButton;
    LabelFormCounter: TLabel;
    DBGridForms: TDBGrid;
    ImageList1: TImageList;
    PanelFormsSettings: TPanel;
    ButtonFormsSettings: TButton;
    Splitter1: TSplitter;
    PanelFormsSettingsButton: TPanel;
    GroupBoxSettings1: TGroupBox;
    CheckListBoxFormsFields: TCheckListBox;
    CheckBoxFormsFieldsAll: TCheckBox;
    PanelCheckBoxFormsFieldControl: TPanel;
    BitBtnCheckBoxOk: TBitBtn;
    BitBtnCheckBoxCancel: TBitBtn;
    DBMemoFormFullName: TDBMemo;
    DBEditFormPeriod: TDBEdit;
    DBEditFormOKUD: TDBEdit;
    DBMemoFormSrok: TDBMemo;
    PopupMenuSort: TPopupMenu;
    NUnsort: TMenuItem;
    ActionList1: TActionList;
    TabNextTab1: TNextTab;
    TabPreviousTab1: TPreviousTab;
    PopupMenuClearMsg: TPopupMenu;
    NClearMsg: TMenuItem;
    GroupBoxFormMainLink: TGroupBox;
    DBEditFormXmlDate: TDBEdit;
    GroupBoxFormGovernmLinks: TGroupBox;
    DBEditFormFill: TDBEdit;
    DBEditFormYtv: TDBEdit;
    DBTextFormName: TDBText;
    DBEditFormXmlLink: TDBEdit;
    DBEditFormDocLink: TDBEdit;
    DBEditFormPdfLink: TDBEdit;
    TabSheetDirectory: TTabSheet;
    ImageListUsefulFiles: TImageList;
    TreeViewUsefulFiles: TTreeView;
    GroupBoxUsefulFiles: TGroupBox;
    NViewInFolder: TMenuItem;
    SSL: TIdSSLIOHandlerSocketOpenSSL;
    PanelOrgFind: TPanel;
    SearchBoxOrgInn: TSearchBox;
    LabelFindOrgMsg: TLabel;
    PanelCheckOrg: TPanel;
    ButtonFormPreview: TButton;
    PanelFormName: TPanel;
    Bevel1: TBevel;
    PanelFormCalendar: TPanel;
    PanelCalendar: TPanel;
    CalendarForms: TCalendarView;
    ListBoxFormCalendar: TListBox;
    ButtonResetCaldendar: TButton;
    LabelCalendarCount: TLabel;
    PanelContent: TPanel;
    ButtonUpdateDir: TButton;
    procedure NLinksCopyToClipboardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonUpdateFormsClick(Sender: TObject);
    procedure ButtonFormsSettingsClick(Sender: TObject);
    procedure CheckBoxFormsFieldsAllClick(Sender: TObject);
    procedure BitBtnCheckBoxCancelClick(Sender: TObject);
    procedure BitBtnCheckBoxOkClick(Sender: TObject);
    procedure EditFormsFindChange(Sender: TObject);
    procedure DBGridFormsTitleClick(Column: TColumn);
    procedure NUnsortClick(Sender: TObject);
    procedure NClearMsgClick(Sender: TObject);
    procedure DBEditFormXmlLinkChange(Sender: TObject);
    procedure DBEditFormDocLinkChange(Sender: TObject);
    procedure DBEditFormPdfLinkChange(Sender: TObject);
    procedure ButtonFormPreviewClick(Sender: TObject);
    procedure NViewInFolderClick(Sender: TObject);
    procedure LabelFormDocClick(Sender: TObject);
    procedure SearchBoxOrgInnInvokeSearch(Sender: TObject);
    procedure CalendarFormsChange(Sender: TObject);
    procedure ListBoxFormCalendarDblClick(Sender: TObject);
    procedure ButtonResetCaldendarClick(Sender: TObject);
    procedure ButtonUpdateDirClick(Sender: TObject);
    procedure TreeViewUsefulFilesDblClick(Sender: TObject);
  private
    { Private declarations }
    //var okuds: array of String;
    var findRecordsInUpdate: array of Integer;
    procedure FillTreeView(const APath: string; ANode: TTreeNode);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;
implementation

{$R *.dfm}

uses DM, TGBot, UnitFormUtils, UnitFormPreview, UnitCheckOrg, UnitUpdate;

// Перерисовка Таблицы для троеточия
procedure TDBGrid.DrawColumnCell(const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  CellText: string;
  TextWidth: Integer;
  MaxWidth: Integer;
begin
  CellText := Column.Field.AsString;
  TextWidth := Canvas.TextWidth(CellText);
  MaxWidth := Rect.Right - Rect.Left - 10;

  if TextWidth > MaxWidth then
  begin
    while (TextWidth > MaxWidth) and (Length(CellText) > 0) do
    begin
      CellText := Copy(CellText, 1, Length(CellText) - 1);
      TextWidth := Canvas.TextWidth(CellText + '...');
    end;
    CellText := CellText + '...';
  end;

  inherited DrawColumnCell(Rect, DataCol, Column, State);

  Canvas.FillRect(Rect);
  TextOut(Canvas.Handle, Rect.Left + 2, Rect.Top + (Rect.Height div 2) - (Canvas.TextHeight(CellText) div 2), PChar(CellText), Length(CellText));
end;

// При создании
procedure TFormMain.FormCreate(Sender: TObject);
var fCaption:array[0..11] of String;
    fSize: array[0..11] of Integer;
begin
  DataModule1.FDConRosstatForm.Open();
  DataModule1.FDTableForms.Open();

  LabelFormCounter.Caption := 'Количество форм: ' + IntToStr(DataModule1.FDTableForms.RecordCount);

  fCaption[0] := 'Название формы';            fSize[0] := 250;
  fCaption[1] := 'Полное название';           fSize[1] := 250;
  fCaption[2] := 'Период';                    fSize[2] := 100;
  fCaption[3] := 'ОКУД';                      fSize[3] := 100;
  fCaption[4] := 'Срок сдачи';                fSize[4] := 250;
  fCaption[5] := 'Дата утверждения';          fSize[5] := 150;
  fCaption[6] := 'Ссылка на утверждение';     fSize[6] := 250;
  fCaption[7] := 'Ссылка на .xml';            fSize[7] := 250;
  fCaption[8] := 'Дата .xml';                 fSize[8] := 100;
  fCaption[9] := 'Ссылка на .doc';            fSize[9] := 250;
  fCaption[10] := 'Ссылка на .pdf';           fSize[10] := 250;
  fCaption[11] := 'Ссылка на документацию';   fSize[11] := 250;

  for var i := 0 to DataModule1.FDTableForms.FieldCount-1 do begin
    DBGridForms.Columns.Add;
    DBGridForms.Columns[i].FieldName := DataModule1.FDTableForms.Fields[i].FieldName;
    DBGridForms.Columns[i].Width := fSize[i];
    DBGridForms.Columns[i].Title.Caption := fCaption[i];
    CheckListBoxFormsFields.Items.Add(fCaption[i]);
  end;
  DBGridForms.Columns[1].Visible := false;
  DBGridForms.Columns[2].Visible := false;
  DBGridForms.Columns[3].Visible := false;
  DBGridForms.Columns[4].Visible := false;
  DBGridForms.Columns[5].Visible := false;
  DBGridForms.Columns[6].Visible := false;
  DBGridForms.Columns[7].Visible := false;
  DBGridForms.Columns[9].Visible := false;
  DBGridForms.Columns[10].Visible := false;
  DBGridForms.Columns[11].Visible := false;

  DBTextFormName.DataField := 'shortName';
  DBMemoFormFullName.DataField := 'fullName';
  DBEditFormPeriod.DataField := 'period';
  DBEditFormOKUD.DataField := 'okud';
  DBMemoFormSrok.DataField := 'srok';
  DBEditFormXmlDate.DataField := 'xmlDate';
  DBEditFormYtv.DataField := 'ytvDate';
  DBEditFormXmlLink.DataField := 'xmlLink';
  DBEditFormDocLink.DataField := 'docLink';
  DBEditFormPdfLink.DataField := 'pdfLink';

  ButtonUpdateDirClick(self);
end;

//======================= КАЛЕНДАРЬ ФОРМ =====================================
// Календарь форм - выбор дня
procedure TFormMain.CalendarFormsChange(Sender: TObject);
var HTTP: TIdHTTP;
    calendarPage, formIndex: string;
    Parts: TStringList;
begin
  HTTP := TIdHTTP.Create(nil);
  HTTP.HandleRedirects:=True;
  HTTP.IOHandler := SSL;
  ListBoxFormCalendar.Clear;
  try
    try
      calendarPage := HTTP.Get('https://rosstat.gov.ru/statlender/items?date=' + DateToStr(CalendarForms.Date));
      calendarPage := TRegEx.Replace(calendarPage, '\s{2,3}', ' ');
      Parts := TStringList.Create;
      UnitFormUtils.SplitByMultipleSpaces(calendarPage, Parts);
      for var i := 0 to Parts.Count-1 do begin
        if ansiPos('<div>Индекс формы</div>', Parts[i]) > 0 then begin
          formIndex := Parts[i+1];
          formIndex := StringReplace(formIndex, '<div>', '', []);
          formIndex := StringReplace(formIndex, '</div>', '', []);
          ListBoxFormCalendar.Items.Add(formIndex);
        end;
      end;
      if ListBoxFormCalendar.Count > 0 then
        LabelCalendarCount.Caption := 'Всего форм за ' + DateToStr(CalendarForms.Date) + ': ' + IntToStr(ListBoxFormCalendar.Count)
      else LabelCalendarCount.Caption := 'Нет форм за ' + DateToStr(CalendarForms.Date);
    except on e:Exception do showMessage(e.ToString);
    end;
  finally
    HTTP.Free;
  end;
end;

// Выбор формы из списка календаря
procedure TFormMain.ListBoxFormCalendarDblClick(Sender: TObject);
begin
  if ListBoxFormCalendar.ItemIndex > -1 then
    //DataModule1.FormsFind(ListBoxFormCalendar.Items[ListBoxFormCalendar.ItemIndex]);
    DataModule1.FDTableForms.locate('shortName', ListBoxFormCalendar.Items[ListBoxFormCalendar.ItemIndex], []);
end;

// Сброс календаря
procedure TFormMain.ButtonResetCaldendarClick(Sender: TObject);
begin
  CalendarForms.Date := Now;
  LabelCalendarCount.Caption := '';
  ListBoxFormCalendar.Clear;
end;

//======================= СПИСОК ФОРМ СТАТИСТИКИ =====================================
// Сортировка таблицы форм
procedure TFormMain.DBGridFormsTitleClick(Column: TColumn);
var sortOrder: string;
    columnIntex: integer;
begin
  DataModule1.columnSort(Column);
  NUnsort.Enabled := true;
end;

// Отмена сортировки
procedure TFormMain.NUnsortClick(Sender: TObject);
var sortingRecord: string;
begin
  DataModule1.columnUnsort();
  NUnsort.Enabled := false;
end;

// Поиск по формам
procedure TFormMain.EditFormsFindChange(Sender: TObject);
begin
  DataModule1.FormsFind('%' + EditFormsFind.Text + '%');
end;

//======================= ПРЕДПРОСМОТР ФОРМЫ =====================================
// Вызов процедуры предпросмотра
procedure TFormMain.ButtonFormPreviewClick(Sender: TObject);
begin
  //if not(Assigned(arrStringGridFormPreview)) then xmlPreview(DBEditFormXmlLink.Text);
  FormPreview.Show;
  FormPreview.xmlPreview(DBEditFormXmlLink.Text);
end;

//======================= НАСТРОЙКИ =====================================
// Вызов панели настроек
procedure TFormMain.ButtonFormsSettingsClick(Sender: TObject);
begin
    PanelFormsSettings.Visible := not(PanelFormsSettings.Visible);
    PanelFormsSettingsButton.SetFocus;

    for var i := 0 to DataModule1.FDTableForms.FieldCount-1 do
      if DBGridForms.Columns[i].Visible then
        CheckListBoxFormsFields.Checked[i] := True
      else CheckListBoxFormsFields.Checked[i] := False;
end;

// Выбрать все формы
procedure TFormMain.CheckBoxFormsFieldsAllClick(Sender: TObject);
begin
  CheckListBoxFormsFields.CheckAll(CheckBoxFormsFieldsAll.State);
end;

// ОК - Показать отмеченные поля форм
procedure TFormMain.BitBtnCheckBoxOkClick(Sender: TObject);
begin
  for var i := 0 to DataModule1.FDTableForms.FieldCount-1 do
      if CheckListBoxFormsFields.Checked[i] then
        DBGridForms.Columns[i].Visible := True
      else DBGridForms.Columns[i].Visible := False;
  PanelFormsSettings.Visible := False;
end;

// Отмена - закрытие окна настроек
procedure TFormMain.BitBtnCheckBoxCancelClick(Sender: TObject);
begin
  PanelFormsSettings.Visible := False;
end;

//======================= ПОЛЕЗНЫЕ ФАЙЛЫ =====================================
procedure TFormMain.ButtonUpdateDirClick(Sender: TObject);
var usefulFilesDir: string;
begin
  usefulFilesDir := ExtractFilePath(Application.ExeName) + 'files\!USEFUL';
  TreeViewUsefulFiles.Items.Clear;
  if DirectoryExists(usefulFilesDir) then
  begin
    // Заполняем TreeView содержимым папки
    FillTreeView(usefulFilesDir, nil);
  end
  else
  begin
    ShowMessage('Папка USEFUL не найдена.');
  end;
  TreeViewUsefulFiles.FullExpand;
end;

procedure TFormMain.FillTreeView(const APath: string; ANode: TTreeNode);
var
  Folders: TStringDynArray;
  Files: TStringDynArray;
  FolderNode: TTreeNode;
  FileNode: TTreeNode;
  I: Integer;
begin
  // Получаем список папок и файлов
  Folders := TDirectory.GetDirectories(APath);
  Files := TDirectory.GetFiles(APath);

  // Добавляем файлы в TreeView
  for I := Low(Files) to High(Files) do
  begin
    FileNode := TreeViewUsefulFiles.Items.AddChild(ANode, TPath.GetFileName(Files[I]));
    FileNode.ImageIndex := 0; // Установите индекс изображения для файла, если используете иконки
    FileNode.SelectedIndex := 0;
  end;

  // Добавляем папки в TreeView
  for I := Low(Folders) to High(Folders) do
  begin
    FolderNode := TreeViewUsefulFiles.Items.AddChild(ANode, TPath.GetFileName(Folders[I]));
    FolderNode.ImageIndex := 1; // Установите индекс изображения для папки
    FolderNode.SelectedIndex := 1;

    // Рекурсивно заполняем папки
    FillTreeView(Folders[I], FolderNode);
  end;
end;

//======================= ОБНОВЛЕНИЕ =====================================

// Кнопка запуска мастера обновления форм
procedure TFormMain.ButtonUpdateFormsClick(Sender: TObject);
begin
  NUnsortClick(Sender);
  PanelFormsSettings.Visible := False;
  if not Assigned(FormUpdate) then Application.CreateForm(TFormUpdate, FormUpdate);
  FormUpdate.show();
end;

//======================= Поиск в ФСГС =====================================
// Поиск организации в ФСГС
procedure TFormMain.SearchBoxOrgInnInvokeSearch(Sender: TObject);
begin
  if SearchBoxOrgInn.Text <> '' then begin
  FormCheckOrg.ManualDock(self.PanelCheckOrg);
  FormCheckOrg.Show();
  FormCheckOrg.checkOrg(SearchBoxOrgInn.Text);
  end;
end;

procedure TFormMain.TreeViewUsefulFilesDblClick(Sender: TObject);
var parentNode, selectedNode: TTreeNode;
    fullPath: string;
begin
  selectedNode := TreeViewUsefulFiles.Selected;
  if Assigned(SelectedNode) then begin
    parentNode := selectedNode.Parent;
    if Assigned(parentNode) then begin
      FullPath := ExtractFilePath(Application.ExeName) + 'files\!USEFUL\' + ParentNode.Text + '\' + SelectedNode.Text;
      ShellExecute(0, 'open', 'explorer.exe', pChar('/select, "' + fullPath + '"'), nil, SW_ShowNormal);
    end;
  end;
end;

//======================= ТГ-БОТ =====================================
// Отправка сообщения в ТГ бота
procedure TFormMain.LabelFormDocClick(Sender: TObject);
var chatId: TStringList;
    listSymbol, breakSymbol, msg: string;
begin
  listSymbol := '%E2%96%8E';
  breakSymbol := '%0A';
  msg := '*' + TNetEncoding.URL.Encode(DBTextFormName.Caption) + '*' + breakSymbol + breakSymbol + listSymbol + '%D0%92%D0%B5%D1%80%D1%81%D0%B8%D1%8F%20xml: ' + DBEditFormXmlDate.Text + '&parse_mode=markdown';
  chatId := TGBot.getChatData;
  for var i := 0 to chatId.Count-1 do
    TGBot.sendMsg(msg, chatId[i]);
end;



// Просмотреть в папке
procedure TFormMain.NViewInFolderClick(Sender: TObject);
var fileName, labelCaption: string;
begin
  labelCaption := (((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent as TLabel).Caption;
  fileName := 'files\' + lowerCase(labelCaption) + '\' + DBTextFormName.Caption + '.' + lowerCase(labelCaption);
  ShellExecute(0, 'open', 'explorer.exe', pChar('/select, "' + ExtractFilePath(Application.ExeName)+fileName + '"'), nil, SW_ShowNormal);
end;

// Копирование подсказки из label (содержит ссылку)
procedure TFormMain.NLinksCopyToClipboardClick(Sender: TObject);
begin
  Clipboard.AsText := (((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent as TLabel).hint;
end;

// Присваивание ссылки в подсказку
procedure TFormMain.DBEditFormXmlLinkChange(Sender: TObject);
begin
  if length(DBEditFormXmlLink.Text) > 0 then begin
    LabelFormXML.Enabled := true;
    ShapeFormXml.Pen.Color := clWhite;
    LabelFormXML.Hint := DBEditFormXmlLink.text;
  end
  else begin
    LabelFormXML.Enabled := false;
    ShapeFormXml.Pen.Color := clGray;
    LabelFormXml.Hint := '';
  end;
end;

procedure TFormMain.DBEditFormDocLinkChange(Sender: TObject);
begin
  if length(DBEditFormDocLink.Text) > 0 then begin
    LabelFormDoc.Enabled := true;
    ShapeFormDoc.Pen.Color := clWhite;
    LabelFormDoc.Hint := DBEditFormDocLink.text;
  end
  else begin
    LabelFormDoc.Enabled := false;
    ShapeFormDoc.Pen.Color := clGray;
    LabelFormDoc.Hint := '';
  end;
end;

procedure TFormMain.DBEditFormPdfLinkChange(Sender: TObject);
begin
  if length(DBEditFormPdfLink.Text) > 0 then begin
    LabelFormPdf.Enabled := true;
    ShapeFormPdf.Pen.Color := clWhite;
    LabelFormPdf.Hint := DBEditFormPdfLink.text;
  end
  else begin
    LabelFormPdf.Enabled := false;
    ShapeFormPdf.Pen.Color := clGray;
    LabelFormPdf.Hint := '';
  end;
end;

// Очистка поля с логами
procedure TFormMain.NClearMsgClick(Sender: TObject);
begin
  (((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent as TMemo).Lines.Clear;
end;

end.

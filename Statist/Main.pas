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
  Vcl.ExtActns, shellApi, NetEncoding;

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
    PanelFormContent: TPanel;
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
    PanelUpdate: TPanel;
    GroupBoxFormsUpdate: TGroupBox;
    CheckBoxForceUpdate: TCheckBox;
    PanelUpdateControl: TPanel;
    PanelUpdateHeader: TPanel;
    PanelUpdateForms: TPanel;
    CheckBoxSelectAllForms: TCheckBox;
    ImageUpdateClose: TImage;
    ButtonCheckForms: TButton;
    ButtonBeginUpdateForms: TButton;
    CheckListBoxFormsUpdate: TCheckListBox;
    EditFormFindUpdate: TEdit;
    PanelFormFindUpdate: TPanel;
    LabelRecordCountUpdate: TLabel;
    SpinButtonChangeRecordUpdate: TSpinButton;
    PopupMenuSort: TPopupMenu;
    NUnsort: TMenuItem;
    MemoUpdateMsg: TMemo;
    Splitter2: TSplitter;
    PanelUpdateMain: TPanel;
    LabelUpdateActualCount: TLabel;
    StringGridActualForms: TStringGrid;
    PageControlUpdate: TPageControl;
    TabSheetFormList: TTabSheet;
    TabSheetNewFormGrid: TTabSheet;
    PanelUpdateGrid: TPanel;
    ActionList1: TActionList;
    TabNextTab1: TNextTab;
    PanelActualControl: TPanel;
    ButtonUpdateUnactual: TButton;
    ButtonUpdateBack: TButton;
    TabPreviousTab1: TPreviousTab;
    ButtonUpdateNext: TButton;
    PopupMenuClearMsg: TPopupMenu;
    NClearMsg: TMenuItem;
    GroupBoxFormMainLink: TGroupBox;
    DBEditFormXmlDate: TDBEdit;
    GroupBoxFormGovernmLinks: TGroupBox;
    DBEditFormFill: TDBEdit;
    DBEditFormYtv: TDBEdit;
    ScrollBoxFormPreview: TScrollBox;
    DBTextFormName: TDBText;
    DBEditFormXmlLink: TDBEdit;
    DBEditFormDocLink: TDBEdit;
    DBEditFormPdfLink: TDBEdit;
    LabelFormPreview: TLabel;
    TabSheetDirectory: TTabSheet;
    ImageListUsefulFiles: TImageList;
    TreeViewUsefulFiles: TTreeView;
    GroupBoxUsefulFiles: TGroupBox;
    PageControlFormContent: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ListBoxFormPreviewSection: TListBox;
    NViewInFolder: TMenuItem;
    SSL: TIdSSLIOHandlerSocketOpenSSL;
    EditOrgINN: TEdit;
    ButtonOrgFind: TButton;
    PanelOrgFind: TPanel;
    Label1: TLabel;
    procedure NLinksCopyToClipboardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonUpdateFormsClick(Sender: TObject);
    procedure ButtonFormsSettingsClick(Sender: TObject);
    procedure CheckBoxFormsFieldsAllClick(Sender: TObject);
    procedure BitBtnCheckBoxCancelClick(Sender: TObject);
    procedure BitBtnCheckBoxOkClick(Sender: TObject);
    procedure EditFormsFindChange(Sender: TObject);
    procedure ImageUpdateCloseClick(Sender: TObject);
    procedure PanelUpdateHeaderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonBeginUpdateFormsClick(Sender: TObject);
    procedure DBGridFormsTitleClick(Column: TColumn);
    procedure NUnsortClick(Sender: TObject);
    procedure ButtonUpdateBackClick(Sender: TObject);
    procedure NClearMsgClick(Sender: TObject);
    procedure DBEditFormXmlLinkChange(Sender: TObject);
    procedure DBEditFormDocLinkChange(Sender: TObject);
    procedure DBEditFormPdfLinkChange(Sender: TObject);
    procedure ScrollBoxFormPreviewMouseWheelDown(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure ScrollBoxFormPreviewMouseWheelUp(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure LabelFormPreviewClick(Sender: TObject);
    procedure LabelFormPreviewMouseEnter(Sender: TObject);
    procedure LabelFormPreviewMouseLeave(Sender: TObject);
    procedure ListBoxFormPreviewSectionClick(Sender: TObject);
    procedure NViewInFolderClick(Sender: TObject);
    procedure LabelFormDocClick(Sender: TObject);
    procedure ButtonOrgFindClick(Sender: TObject);
  private
    { Private declarations }
    //var okuds: array of String;
    var findRecordsInUpdate: array of Integer;
        arrStringGridFormPreview: array of TStringGrid;
        arrLabelFormPreview: array of TLabel;
    procedure loadForms();
    procedure clearDB();
    procedure xmlPreview(xmlLink: string);
    procedure downloadFile(const url, destPath, fileName, formatFile: string);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;
implementation

{$R *.dfm}

uses DM, TGBot, UnitFormUtils, UnitFormPreview;

// Перерисовка Таблицы для троеточия
procedure TDBGrid.DrawColumnCell(const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  CellText: string;
  TextWidth: Integer;
  MaxWidth: Integer;
begin
  // Получаем текст из текущей ячейки
  CellText := Column.Field.AsString;

  // Вычисляем ширину текста
  TextWidth := Canvas.TextWidth(CellText);

  // Максимальная ширина ячейки
  MaxWidth := Rect.Right - Rect.Left - 10; // Учитываем небольшой отступ

  // Если текст шире, чем ячейка, добавляем троеточие
  if TextWidth > MaxWidth then
  begin
    // Убираем часть текста и добавляем троеточие
    while (TextWidth > MaxWidth) and (Length(CellText) > 0) do
    begin
      CellText := Copy(CellText, 1, Length(CellText) - 1);
      TextWidth := Canvas.TextWidth(CellText + '...');
    end;
    CellText := CellText + '...';
  end;

  // Рисуем ячейку с нужным текстом
  inherited DrawColumnCell(Rect, DataCol, Column, State);

  // Рисуем текст в ячейке
  Canvas.FillRect(Rect);
  TextOut(Canvas.Handle, Rect.Left + 2, Rect.Top + (Rect.Height div 2) - (Canvas.TextHeight(CellText) div 2), PChar(CellText), Length(CellText));
end;

// При создании
procedure TFormMain.FormCreate(Sender: TObject);
var fCaption:array[0..11] of String;
    fSize: array[0..11] of Integer;
begin
  Self.Position := poScreenCenter;

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
end;

// Выбрать все формы
procedure TFormMain.CheckBoxFormsFieldsAllClick(Sender: TObject);
begin
  CheckListBoxFormsFields.CheckAll(CheckBoxFormsFieldsAll.State);
end;

// Присваивание ссылки в подсказку
procedure TFormMain.DBEditFormXmlLinkChange(Sender: TObject);
begin
  if Assigned(arrStringGridFormPreview) then begin
    for var i := 0 to Length(arrStringGridFormPreview)-1 do begin
      freeAndNil(arrStringGridFormPreview[i]);
      freeAndNil(arrLabelFormPreview[i]);
    end;
    setLength(arrStringGridFormPreview, 0);
    setLength(arrLabelFormPreview, 0);
    ListBoxFormPreviewSection.Clear;
  end;

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

// Просмотреть в папке
procedure TFormMain.NViewInFolderClick(Sender: TObject);
var fileName, labelCaption: string;
begin
  labelCaption := (((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent as TLabel).Caption;
  fileName := 'files\' + lowerCase(labelCaption) + '\' + DBTextFormName.Caption + '.' + lowerCase(labelCaption);
  ShellExecute(0, 'open', 'explorer.exe', pChar('/select, "' + ExtractFilePath(Application.ExeName)+fileName + '"'), nil, SW_ShowNormal);
end;

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

//======================= ПРЕДПРОСМОТР ФОРМЫ =====================================
// Вызов процедуры предпросмотра
procedure TFormMain.LabelFormPreviewClick(Sender: TObject);
begin
  //if not(Assigned(arrStringGridFormPreview)) then xmlPreview(DBEditFormXmlLink.Text);
  FormPreview.Show;
  FormPreview.xmlPreview(DBEditFormXmlLink.Text);
end;

// Создание предпросмотра
procedure TFormMain.xmlPreview(xmlLink: string);
var HTTP: TIdHTTP;
    XMLDoc: IXMLDocument;
    metaFormNode, sections, section, columns, rows: IXMLNode;
    xmlFile: TFileStream;
    sectionCount, colCount, rowCount: Integer;
begin
  HTTP := TIdHTTP.Create(nil);
  HTTP.HandleRedirects:=True;
  HTTP.IOHandler := SSL;
  XMLDoc := TXMLDocument.Create(nil);
  xmlFile := TFileStream.Create('a.xml', fmCreate);
  try
    HTTP.Get(xmlLink, xmlFile);
    XMLDoc.LoadFromStream(xmlFile);
    metaFormNode := xmlDoc.DocumentElement;
    sections := metaFormNode.ChildNodes['sections'];
    sectionCount := sections.ChildNodes.Count;
    for var i := 0 to sectionCount-1 do begin
      setLength(arrStringGridFormPreview, i+1);
      setLength(arrLabelFormPreview, i+1);

      section := sections.ChildNodes[i];
      columns := section.ChildNodes['columns'];
      rows := section.ChildNodes['rows'];

      colCount := columns.ChildNodes.Count;
      rowCount := rows.ChildNodes.Count + 2;

      arrLabelFormPreview[i] := TLabel.Create(ScrollBoxFormPreview);
      arrLabelFormPreview[i].parent := ScrollBoxFormPreview;
      arrLabelFormPreview[i].Height := 25;
      if i = 0 then arrLabelFormPreview[i].Top := LabelFormPreview.Height + 15
      else arrLabelFormPreview[i].Top := arrStringGridFormPreview[i-1].Top + arrStringGridFormPreview[i-1].Height + 15;
      arrLabelFormPreview[i].Caption := section.Attributes['name'];
      arrLabelFormPreview[i].Font.Name := 'Montserrat';

      ListBoxFormPreviewSection.Items.Add(arrLabelFormPreview[i].Caption);

      arrStringGridFormPreview[i] := TStringGrid.Create(ScrollBoxFormPreview);
      arrStringGridFormPreview[i].Parent := ScrollBoxFormPreview;
      arrStringGridFormPreview[i].Font.Size := 8;
      arrStringGridFormPreview[i].top := arrLabelFormPreview[i].Top + 25;
      arrStringGridFormPreview[i].left := 10;
      arrStringGridFormPreview[i].ColCount := colCount;
      arrStringGridFormPreview[i].RowCount := rowCount;
      arrStringGridFormPreview[i].FixedCols := 0;
      arrStringGridFormPreview[i].FixedRows := 2;
      arrStringGridFormPreview[i].Width := ScrollBoxFormPreview.Width - arrStringGridFormPreview[i].left - 20;
      arrStringGridFormPreview[i].Height := rowCount * 31;
      arrStringGridFormPreview[i].Options := [goColSizing];
      arrStringGridFormPreview[i].OnMouseWheelDown := ScrollBoxFormPreviewMouseWheelDown;
      arrStringGridFormPreview[i].OnMouseWheelUp := ScrollBoxFormPreviewMouseWheelUp;
      arrStringGridFormPreview[i].Options := arrStringGridFormPreview[i].Options + [goColSizing] + [goVertLine] + [goHorzLine] + [goFixedVertLine] + [goFixedHorzLine];
      arrStringGridFormPreview[i].Anchors := arrStringGridFormPreview[i].Anchors + [akRight];
      arrStringGridFormPreview[i].StyleName := 'Windows';
      arrStringGridFormPreview[i].DrawingStyle := gdsGradient;
      arrStringGridFormPreview[i].Color := $00202020;
      arrStringGridFormPreview[i].FixedColor := $002B2B2B;
      arrStringGridFormPreview[i].GradientStartColor := $002C2C2C;
      arrStringGridFormPreview[i].GradientEndColor := $00242424;
      arrStringGridFormPreview[i].Font.Color := clWhite;
      arrStringGridFormPreview[i].BorderStyle := bsNone;

      for var col := 0 to colCount-1 do begin
        arrStringGridFormPreview[i].Cells[col, 0] := columns.ChildNodes[col].Attributes['name'];
        arrStringGridFormPreview[i].Cells[col, 1] := columns.ChildNodes[col].Attributes['code'];
        arrStringGridFormPreview[i].ColWidths[col] := arrStringGridFormPreview[i].Canvas.TextWidth(arrStringGridFormPreview[i].Cells[col, 0]) + 20;
      end;

      var maxColSize := 0;
      for var row := 0 to rowCount-3 do begin
        arrStringGridFormPreview[i].Cells[0, row+2] := rows.ChildNodes[row].Attributes['name'];
        arrStringGridFormPreview[i].Cells[1, row+2] := rows.ChildNodes[row].Attributes['code'];
        if arrStringGridFormPreview[i].Canvas.TextWidth(arrStringGridFormPreview[i].Cells[0, row+2]) > maxColSize then maxColSize := arrStringGridFormPreview[i].Canvas.TextWidth(arrStringGridFormPreview[i].Cells[0, row+2]);
      end;
      arrStringGridFormPreview[i].ColWidths[0] := maxColSize + 40;
    end;
  finally
    xmlFile.Free;
    HTTP.Free;
  end;
end;

// Подчеркивание при наведении на label "Предпросмотр формы"
procedure TFormMain.LabelFormPreviewMouseEnter(Sender: TObject);
begin
  LabelFormPreview.Font.Style := LabelFormPreview.Font.Style + [fsUnderline];
end;

procedure TFormMain.LabelFormPreviewMouseLeave(Sender: TObject);
begin
  LabelFormPreview.Font.Style := LabelFormPreview.Font.Style - [fsUnderline];
end;

//Переход по разделам формы при предпросмотре
procedure TFormMain.ListBoxFormPreviewSectionClick(Sender: TObject);
var top, height: Integer;
begin
  if ListBoxFormPreviewSection.ItemIndex >= 0 then begin
    top := arrLabelFormPreview[ListBoxFormPreviewSection.ItemIndex].Top + ScrollBoxFormPreview.VertScrollBar.Position;
    height := arrLabelFormPreview[ListBoxFormPreviewSection.ItemIndex].Height;

    if top < 0 then ScrollBoxFormPreview.VertScrollBar.Position := 0
    else if top + ScrollBoxFormPreview.Height > ScrollBoxFormPreview.ClientHeight then ScrollBoxFormPreview.VertScrollBar.Position := top - ScrollBoxFormPreview.ClientHeight + ScrollBoxFormPreview.Height;
  end;
end;

// Прокрутка окна предпросмотра формы
procedure TFormMain.ScrollBoxFormPreviewMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  ScrollBoxFormPreview.VertScrollBar.Position := ScrollBoxFormPreview.VertScrollBar.Position + ScrollBoxFormPreview.VertScrollBar.Increment + 15;
  Handled := True;
end;

procedure TFormMain.ScrollBoxFormPreviewMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  ScrollBoxFormPreview.VertScrollBar.Position := ScrollBoxFormPreview.VertScrollBar.Position - ScrollBoxFormPreview.VertScrollBar.Increment - 15;
  Handled := True;
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

//======================= ОБНОВЛЕНИЕ =====================================

// Кнопка запуска мастера обновления форм
procedure TFormMain.ButtonUpdateBackClick(Sender: TObject);
begin
  PageControlUpdate.SelectNextPage(true, false);
end;

procedure TFormMain.ButtonUpdateFormsClick(Sender: TObject);
begin
  NUnsortClick(Sender);
  PanelForms.Enabled := false;
  PanelFormsSettings.Visible := False;
  PanelUpdate.Visible := True;

  PanelUpdate.SetFocus;
  if CheckListBoxFormsUpdate.Count <= 0 then begin
    var i := 0;

    DataModule1.FDQueryForms.SQL.Text := 'select * from Forms';
    DataModule1.FDQueryForms.Open();
    CheckListBoxFormsUpdate.Items.BeginUpdate;
    while not DataModule1.FDQueryForms.Eof do begin
      CheckListBoxFormsUpdate.Items.Add(DataModule1.FDQueryForms.FieldByName('shortName').AsString);
      DataModule1.FDQueryForms.Next;
      inc(i);
    end;
    CheckListBoxFormsUpdate.Items.EndUpdate;
    DataModule1.FDQueryForms.Close;
  end;
  PageControlUpdate.ActivePageIndex := -1;
  PageControlUpdate.SelectNextPage(true, false);
end;

// Закрытие панели Мастера обновления
procedure TFormMain.ImageUpdateCloseClick(Sender: TObject);
begin
  PanelUpdate.Visible := False;
  PanelForms.Enabled := true;
end;

// Перемещение панели обновления
procedure TFormMain.PanelUpdateHeaderMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const SC_DragMove = $F012;
begin
   ReleaseCapture;
   PanelUpdate.Perform(WM_SysCommand, SC_DragMove, 0);
end;

// Проверка актуальности выбранных форм


// Принудительнное обновление
procedure TFormMain.ButtonOrgFindClick(Sender: TObject);
var data: TStringStream;
    HTTP: TIdHTTP;
    url, url2: string;
begin
  HTTP := TIdHTTP.Create(nil);
  HTTP.HandleRedirects:=True;
  HTTP.IOHandler := SSL;
  HTTP.Request.ContentType := 'application/json';
  data := TStringStream.Create(
  '{"inn":"' + EditOrgInn.Text +'",' +
  '"ogrn": "",' +
  '"okpo":""}');
  url := 'https://websbor.rosstat.gov.ru/webstat/api/gs/organizations';
  try
    //Memo1.Text := HTTP.Post(url,data);
  finally

  end;
end;

procedure TFormMain.ButtonBeginUpdateFormsClick(Sender: TObject);
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
            MemoUpdateMsg.Lines.Add('[' + DateTimeToStr(Now) + '] Начало обновления');
            clearDB;
            loadForms;
            DataModule1.FDTableForms.Open();
            MemoUpdateMsg.Lines.Add('[' + DateTimeToStr(Now) + '] Обновление завершено');
          end;
        except  on e: EIdHTTPProtocolException do MemoUpdateMsg.Lines.Add('[' + DateTimeToStr(Now) + '] [HTTP code ' + intToStr(HTTP.ResponseCode) + '] ' + e.Message);
                on e: Exception do MemoUpdateMsg.Lines.Add('[' + DateTimeToStr(Now) + '] ' + e.Message);
        end;
      finally
        HTTP.Free;
      end;
  end;
end;

procedure TFormMain.clearDB();
begin
  DataModule1.FDQueryForms.SQL.Text := 'delete from Forms';
  DataModule1.FDQueryForms.ExecSQL;
end;

// Загрузка форм
procedure TFormMain.loadForms();
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
        MemoUpdateMsg.Lines.Add('[' + DateTimeToStr(Now) + '] Обработка формы ' + shortName + '...');
        Application.ProcessMessages;
        try
          DataModule1.writeToDB(shortName, longName, period, Okud, srok, dateYtv, DateYtvLink, XMLLink, DOCLink, PDFLink);
        except on e:Exception do MemoUpdateMsg.Lines.Add('[' + DateTimeToStr(Now) + ']' + e.Message);
        end;
        downloadFile('https://rosstat.gov.ru'+XMLLink, ExtractFilePath(Application.ExeName) + 'files\xml\', shortName, '.xml');
      end;
      JSONPage.Free;
    end;
  except on e:Exception do MemoUpdateMsg.Lines.Add('[' + DateTimeToStr(Now) + ']' + e.Message);

  end;
  finally
    HTTP.Free;
  end;

  //test := HTTP.Get('https://rosstat.gov.ru/monitoring/getPage?page=1&query=&year=2024&heading=');
  //showMessage(IntToStr(Http.ResponseCode));
end;

// Скачивание файла
procedure TFormMain.downloadFile(const url, destPath, fileName, formatFile: string);
var HTTP: TIdHTTP;
    myFile: TFileStream;
begin
    MemoUpdateMsg.Lines.Add('[' + DateTimeToStr(Now) + '] Скачивание формы ' + fileName + '...');
    HTTP := TIdHTTP.Create(nil);
    HTTP.HandleRedirects:=True;
    HTTP.IOHandler := SSL;

    myFile := TFileStream.Create(destPath + fileName + formatFile, fmCreate);
    try
      try
      HTTP.Get(url, myFile);
      except on E:EIdHTTPProtocolException do showMessage('Ошибка при скачивании');
             on E: Exception do showMessage('Ошибка при скачивании');
      end;
    finally
      HTTP.Free;
      FreeAndNil(myFile);
    end;
end;

// Поиск по формам
procedure TFormMain.EditFormsFindChange(Sender: TObject);
begin
  if Length(EditFormsFind.Text) > 0 then begin
    DataModule1.DataSource1.DataSet := DataModule1.FDQueryForms;
    DataModule1.FDQueryForms.SQL.Text := 'select * from Forms where shortName like ' + '''%' + EditFormsFind.Text + '%''';
    DataModule1.FDQueryForms.Open();
  end else DataModule1.DataSource1.DataSet := DataModule1.FDTableForms;
end;

// Очистка поля с логами
procedure TFormMain.NClearMsgClick(Sender: TObject);
begin
  (((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent as TMemo).Lines.Clear;
end;

// Копирование подсказки из label (содержит ссылку)
procedure TFormMain.NLinksCopyToClipboardClick(Sender: TObject);
begin
  Clipboard.AsText := (((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent as TLabel).hint;
end;

end.

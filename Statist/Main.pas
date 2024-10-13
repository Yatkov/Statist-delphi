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
  Vcl.ExtActns;

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
    LabelUpdateHelp1: TLabel;
    ButtonBeginUpdateForms: TButton;
    LabelUpdateHelp2: TLabel;
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
    procedure NLinksCopyToClipboardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonUpdateFormsClick(Sender: TObject);
    procedure ButtonFormsSettingsClick(Sender: TObject);
    procedure CheckBoxFormsFieldsAllClick(Sender: TObject);
    procedure BitBtnCheckBoxCancelClick(Sender: TObject);
    procedure BitBtnCheckBoxOkClick(Sender: TObject);
    procedure EditFormsFindChange(Sender: TObject);
    procedure DBGridFormsCellClick(Column: TColumn);
    procedure ImageUpdateCloseClick(Sender: TObject);
    procedure PanelUpdateHeaderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonBeginUpdateFormsClick(Sender: TObject);
    procedure CheckBoxForceUpdateClick(Sender: TObject);
    procedure ButtonCheckFormsClick(Sender: TObject);
    procedure EditFormFindUpdateChange(Sender: TObject);
    procedure SpinButtonChangeRecordUpdateDownClick(Sender: TObject);
    procedure SpinButtonChangeRecordUpdateUpClick(Sender: TObject);
    procedure CheckBoxSelectAllFormsClick(Sender: TObject);
    procedure DBGridFormsTitleClick(Column: TColumn);
    procedure NUnsortClick(Sender: TObject);
    procedure ButtonUpdateBackClick(Sender: TObject);
    procedure ButtonUpdateNextClick(Sender: TObject);
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
  private
    { Private declarations }
    //var okuds: array of String;
    var findRecordsInUpdate: array of Integer;
        fSortColumn: string;
        fSortDirection: boolean;
        arrStringGridFormPreview: array of TStringGrid;
        arrLabelFormPreview: array of TLabel;
    procedure loadForms();
    procedure printData(shortName, longName, XMLLink, DOCLink, PDFLink, period, srok, DateYtv: String);
    procedure SplitByMultipleSpaces(const Input: string; List: TStringList);
    function formatText(inputText, firstPos, lastPos: String):String;
    function JSONUnescape(const Source: string; CRLF: string = #13#10): string;
    procedure clearDB();
    procedure writeToDB(shortName, longName, period, Okud, srok, dateYtv, DateYtvLink, XMLLink, DOCLink, PDFLink: String);
    function parseXML(fileLink: string): String;
    function checkVersionForm(formLink: string): String;
    procedure xmlPreview(xmlLink: string);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;
implementation

{$R *.dfm}

uses DM;

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

  PanelUpdate.Left := (screen.width - PanelUpdate.Width) div 2;
  PanelUpdate.Top := (screen.height - PanelUpdate.Height) div 3;

  StringGridActualForms.Cells[0,0] := 'Форма';
  StringGridActualForms.Cells[1,0] := 'ОКУД';
  StringGridActualForms.Cells[2,0] := 'Старая версия';
  StringGridActualForms.Cells[3,0] := 'Новая версия';
end;

// Выбрать все формы
procedure TFormMain.CheckBoxFormsFieldsAllClick(Sender: TObject);
begin
  CheckListBoxFormsFields.CheckAll(CheckBoxFormsFieldsAll.State);
end;

procedure TFormMain.printData(shortName, longName, XMLLink, DOCLink, PDFLink, period, srok, DateYtv: String);
begin
  {LabelFormName.Caption := shortName;
  EditFormFullName.Text := longName;
  LabelFormXML.Hint := XMLLink;
  LabelFormDoc.Hint := DOCLink;
  LabelFormPdf.Hint := PDFLink;
  EditFormPeriod.Text := period;
  MemoFormSrok.Text := srok;
  EditFormYtv.Text := DateYtv; }
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

// Выбор формы из списка
procedure TFormMain.DBGridFormsCellClick(Column: TColumn);
var shortName: string;
begin
  //LabelFormName.Caption := DBGridForms.Fields[0].AsString;
end;

// Сортировка таблицы форм
procedure TFormMain.DBGridFormsTitleClick(Column: TColumn);
var sortOrder: string;
    columnIntex: integer;
begin
 if fSortColumn = Column.FieldName then
  fSortDirection := not fSortDirection
 else begin
  fSortColumn := Column.FieldName;
  fSortDirection := True;
 end;

 if fSortDirection then sortOrder := 'A'
 else sortOrder := 'D';

 DataModule1.FDTableForms.Close;
 if DataModule1.FDTableForms.IndexFieldNames <> '' then DBGridForms.Columns[Column.Index].Title.Caption := Copy(DBGridForms.Columns[Column.Index].Title.Caption, 1, Length(DBGridForms.Columns[Column.Index].Title.Caption)-2);
 DataModule1.FDTableForms.IndexFieldNames := fSortColumn + ':' + sortOrder;

 if sortOrder = 'A' then DBGridForms.Columns[Column.Index].Title.Caption := DBGridForms.Columns[Column.Index].Title.Caption + ' ↓';
 if sortOrder = 'D' then DBGridForms.Columns[Column.Index].Title.Caption := DBGridForms.Columns[Column.Index].Title.Caption + ' ↑';

 DataModule1.FDTableForms.Open;
 NUnsort.Enabled := true;
end;

// Отмена сортировки
procedure TFormMain.NUnsortClick(Sender: TObject);
var sortingRecord: string;
begin
  fSortColumn := '';
  fSortDirection := True;
  DataModule1.FDTableForms.Close;
  sortingRecord := copy(DataModule1.FDTableForms.IndexFieldNames, 1, Length(DataModule1.FDTableForms.IndexFieldNames)-2);
  DataModule1.FDTableForms.IndexFieldNames := '';
  DataModule1.FDTableForms.Open;
  NUnsort.Enabled := false;

  for var i := 0 to DataModule1.FDTableForms.FieldCount-1 do begin
    if DBGridForms.Columns[i].FieldName = sortingRecord then begin
      DBGridForms.Columns[i].Title.Caption := Copy(DBGridForms.Columns[i].Title.Caption, 1, Length(DBGridForms.Columns[i].Title.Caption)-2);
      break;
    end;
  end;
end;

// Вызов процедуры предпросмотра
procedure TFormMain.LabelFormPreviewClick(Sender: TObject);
begin
  if not(Assigned(arrStringGridFormPreview)) then xmlPreview(DBEditFormXmlLink.Text);
end;

// Предпросмотр формы
procedure TFormMain.xmlPreview(xmlLink: string);
var HTTP: TIdHTTP;
    SSL:TIdSSLIOHandlerSocketOpenSSL;
    XMLDoc: IXMLDocument;
    metaFormNode, sections, section, columns, rows: IXMLNode;
    xmlFile: TFileStream;
    sectionCount, colCount, rowCount: Integer;
begin
  HTTP := TIdHTTP.Create(nil);
  HTTP.HandleRedirects:=True;
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(HTTP);
  HTTP.IOHandler := SSL;
  SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions - [sslvTLSv1];
  SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions + [sslvTLSv1_2];
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
      arrStringGridFormPreview[i].Height := rowCount * 26;
      arrStringGridFormPreview[i].Options := [goColSizing];
      arrStringGridFormPreview[i].OnMouseWheelDown := ScrollBoxFormPreviewMouseWheelDown;
      arrStringGridFormPreview[i].OnMouseWheelUp := ScrollBoxFormPreviewMouseWheelUp;
      arrStringGridFormPreview[i].Options := arrStringGridFormPreview[i].Options + [goColSizing] + [goVertLine] + [goHorzLine] + [goFixedVertLine] + [goFixedHorzLine];
      arrStringGridFormPreview[i].Anchors := arrStringGridFormPreview[i].Anchors + [akRight];

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
    LabelFormPreview.Align := alBottom;
  LabelFormPreview.Align := alTop;
  finally
    xmlFile.Free;
    SSL.Free;
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

procedure TFormMain.ButtonUpdateNextClick(Sender: TObject);
begin
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

// Выбрать все формы в обновлении
procedure TFormMain.CheckBoxSelectAllFormsClick(Sender: TObject);
begin
  CheckListBoxFormsUpdate.CheckAll(CheckBoxSelectAllForms.State);
end;

// Включить возможность принудительного обновления
procedure TFormMain.CheckBoxForceUpdateClick(Sender: TObject);
begin
  if Application.MessageBox(pChar('Включить возможность принудительного обновления? Такое обновление очистит всю базу данных и займет какое то время на добавление'), 'Включение принудительного обновления', MB_YESNO) = idYes then begin
    ButtonBeginUpdateForms.Enabled := CheckBoxForceUpdate.Checked;
    PanelUpdate.SetFocus;
  end;
end;

// Поиск по формам в окне обновления
procedure TFormMain.EditFormFindUpdateChange(Sender: TObject);
begin
  if Length(EditFormFindUpdate.Text) = 0 then begin
    LabelRecordCountUpdate.Caption := '';
    SpinButtonChangeRecordUpdate.Enabled := false;
  end else begin

    setLength(findRecordsInUpdate, 0);
    for var i := 0 to CheckListBoxFormsUpdate.Count-1 do begin
      if Pos(EditFormFindUpdate.Text, CheckListBoxFormsUpdate.Items[i]) > 0 then begin
        setLength(findRecordsInUpdate, Length(findRecordsInUpdate)+1);
        findRecordsInUpdate[Length(findRecordsInUpdate)-1] := i;
      end;
    end;

    if Length(findRecordsInUpdate) > 0 then begin
      LabelRecordCountUpdate.Caption := ' 1 / ' + Length(findRecordsInUpdate).ToString;
      CheckListBoxFormsUpdate.Selected[findRecordsInUpdate[0]] := true;
    end;
    SpinButtonChangeRecordUpdate.Enabled := true;
  end;
end;

// Перемещение между найденными записями в Обновлении - вниз
procedure TFormMain.SpinButtonChangeRecordUpdateDownClick(Sender: TObject);
var currentRecord, recordsCount: String;
begin
  currentRecord := LabelRecordCountUpdate.Caption;
  recordsCount := LabelRecordCountUpdate.Caption;

  Delete(currentRecord, Pos(' / ', currentRecord), length(currentRecord));
  Delete(recordsCount, 1, Pos(' / ', recordsCount)+1);

  if StrToInt(currentRecord) < StrToInt(recordsCount) then begin
    currentRecord := IntToStr(StrToInt(currentRecord)+1);
    LabelRecordCountUpdate.Caption := ' ' + currentRecord + ' /' + recordsCount;
    CheckListBoxFormsUpdate.Selected[findRecordsInUpdate[StrToInt(currentRecord)-1]] := true;
  end;
end;

// Перемещение между найденными записями в Обновлении - наверх
procedure TFormMain.SpinButtonChangeRecordUpdateUpClick(Sender: TObject);
var currentRecord, recordsCount: String;
begin
  currentRecord := LabelRecordCountUpdate.Caption;
  recordsCount := LabelRecordCountUpdate.Caption;

  Delete(currentRecord, Pos(' / ', currentRecord), length(currentRecord));
  Delete(recordsCount, 1, Pos(' / ', recordsCount)+1);

  if StrToInt(currentRecord) > 1 then begin
    currentRecord := IntToStr(StrToInt(currentRecord)-1);
    LabelRecordCountUpdate.Caption := ' ' + currentRecord + ' /' + recordsCount;
    CheckListBoxFormsUpdate.Selected[findRecordsInUpdate[StrToInt(currentRecord)-1]] := true;
  end;
end;

// Проверка актуальности выбранных форм
procedure TFormMain.ButtonCheckFormsClick(Sender: TObject);
var okud, oldVersion, newVersion: string;
    findCounter: integer;
begin
  StringGridActualForms.RowCount := 2;
  StringGridActualForms.Cells[0,1] := '';
  StringGridActualForms.Cells[1,1] := '';
  StringGridActualForms.Cells[2,1] := '';
  StringGridActualForms.Cells[3,1] := '';

  PanelUpdate.SetFocus;
  if Application.MessageBox(pChar('Проверить отмеченные формы?'), 'Проверка актуальности', MB_YESNO) = idYes then begin
    PageControlUpdate.SelectNextPage(true, false);
    findCounter := 0;
    MemoUpdateMsg.Lines.Add('[' + DateTimeToStr(Now) + '] ' + 'Начало проверки актуальности');
    for var i := 0 to CheckListBoxFormsUpdate.Count-1 do begin
      if CheckListBoxFormsUpdate.Checked[i] then begin
        DataModule1.FDQueryForms.SQL.Text := 'Select okud, xmlDate from Forms where shortName = ' + '''' + CheckListBoxFormsUpdate.Items[i] + '''';
        MemoUpdateMsg.Lines.Add('[' + DateTimeToStr(Now) + '] ' + 'Проверяется ' + CheckListBoxFormsUpdate.Items[i] + '...');
        DataModule1.FDQueryForms.Open;
        okud := DataModule1.FDQueryForms.FieldByName('okud').AsString;
        oldVersion := DataModule1.FDQueryForms.FieldByName('xmlDate').AsString;
        newVersion := checkVersionForm('https://rosstat.gov.ru/monitoring/getPage?query='+ okud +'&heading=&year=2024&page=1');

        if (length(oldVersion) > 0) and (length(newVersion) > 0) then begin
          if StrToDate(newVersion) > StrToDate(oldVersion) then begin
            MemoUpdateMsg.Lines[MemoUpdateMsg.Lines.Count-1] := MemoUpdateMsg.Lines[MemoUpdateMsg.Lines.Count-1] + ' Требуется обновление';
            inc(findCounter);
            StringGridActualForms.Cells[0, StringGridActualForms.RowCount-1] := CheckListBoxFormsUpdate.Items[i];
            StringGridActualForms.Cells[1, StringGridActualForms.RowCount-1] := okud;
            StringGridActualForms.Cells[2, StringGridActualForms.RowCount-1] := oldVersion;
            StringGridActualForms.Cells[3, StringGridActualForms.RowCount-1] := newVersion;
            StringGridActualForms.RowCount := StringGridActualForms.RowCount + 1;
          end else MemoUpdateMsg.Lines[MemoUpdateMsg.Lines.Count-1] := MemoUpdateMsg.Lines[MemoUpdateMsg.Lines.Count-1] + ' Актуальна';
        end;
      end;
    end;
    MemoUpdateMsg.Lines.Add('[' + DateTimeToStr(Now) + '] ' + 'Актуальность форм проверена');
    if findCounter > 0 then begin
      StringGridActualForms.RowCount := StringGridActualForms.RowCount - 1;
      ButtonUpdateNext.Visible := True;
      LabelUpdateActualCount.Caption := 'Найдено форм к обновлению: ' + IntToStr(findCounter);
    end;
  end;
end;

function TFormMain.checkVersionForm(formLink: string): String;
var HTTP: TIdHTTP;
    SSL:TIdSSLIOHandlerSocketOpenSSL;
    JSONPage: TJSONObject;
    pageRosstat, htmlDoc, XMLLink: string;
    Parts: TStringList;
    XMLPos: integer;
begin
  HTTP := TIdHTTP.Create(nil);
  HTTP.HandleRedirects:=True;
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(HTTP);
  HTTP.IOHandler := SSL;
  SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions - [sslvTLSv1];
  SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions + [sslvTLSv1_2];
  try
    try
      pageRosstat := HTTP.Get(formLink);
      JSONPage :=TJSONObject.Create;
      JSONPage.Parse(TEncoding.UTF8.GetBytes(pageRosstat),0);
      JSONPage.TryGetValue('html', htmlDoc);
      htmlDoc := JSONUnescape(htmlDoc);
      htmlDoc := TRegEx.Replace(htmlDoc, '\s{2,3}', ' ');
      Parts := TStringList.Create;
      SplitByMultipleSpaces(htmlDoc, Parts);
      XMLPos:= 0;
      for var i := 0 to Parts.Count-1 do begin
        if (AnsiPos('<a class="btn btn-icon btn-white btn-br"', Parts[i]) > 0) and (AnsiPos('.xml', Parts[i]) > 0) then begin
          XMLPos := i;
          break;
        end;
      end;
      if XMLPos > 0 then XMLLink := formatText(Parts[XMLPos], '<a class="btn btn-icon btn-white btn-br" href="', '" download>');

      checkVersionForm := parseXML('https://rosstat.gov.ru' + XMLLink);
    except on e:Exception do showMessage('hui');

    end;
  finally
    SSL.Free;
    HTTP.Free;
  end;
end;

// Принудительнное обновление
procedure TFormMain.ButtonBeginUpdateFormsClick(Sender: TObject);
var HTTP: TIdHTTP;
    SSL:TIdSSLIOHandlerSocketOpenSSL;
begin
  if Application.MessageBox(pChar('Обновить все формы принудительно? Данные базы данных очистяться!'), 'Обновление форм', MB_YESNO) = idYes then begin
      HTTP := TIdHTTP.Create(nil);
      HTTP.HandleRedirects:=True;
      SSL := TIdSSLIOHandlerSocketOpenSSL.Create(HTTP);
      HTTP.IOHandler := SSL;
      SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions - [sslvTLSv1];
      SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions + [sslvTLSv1_2];
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
        SSL.Free;
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
    SSL:TIdSSLIOHandlerSocketOpenSSL;
begin
  HTTP := TIdHTTP.Create(nil);
  HTTP.HandleRedirects:=True;
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(HTTP);
  HTTP.IOHandler := SSL;
  SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions - [sslvTLSv1];
  SSL.SSLOptions.SSLVersions:= SSL.SSLOptions.SSLVersions + [sslvTLSv1_2];
  //HTTP.ConnectTimeout := 5000;
  //HTTP.ReadTimeout := 5000;
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
        MemoUpdateMsg.Lines.Add('[' + DateTimeToStr(Now) + '] Обработка формы ' + shortName + '...');
        Application.ProcessMessages;
        writeToDB(shortName, longName, period, Okud, srok, DateYtv, DateYtvLink, XMLLink, DOCLink, PDFLink);
      end;
      JSONPage.Free;
      //printData(shortName, longName, XMLLink, DOCLink, PDFLink, period, srok, DateYtv);
    end;
  except on e:Exception do MemoUpdateMsg.Lines.Add('[' + DateTimeToStr(Now) + ']' + e.Message);

  end;
  finally
    SSL.Free;
    HTTP.Free;
  end;

  //test := HTTP.Get('https://rosstat.gov.ru/monitoring/getPage?page=1&query=&year=2024&heading=');
  //showMessage(IntToStr(Http.ResponseCode));
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

// Парсинг .xml
function TFormMain.parseXML(fileLink: string): String;
var XMLDoc: IXMLDocument;
    XMLNode: IXMLNode;
    xmlFile: TMemoryStream;
    version: string;

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
      version := XMLDoc.ChildNodes['metaForm'].AttributeNodes['version'].Text;
      version := StringReplace(version, '-', '.' , [rfReplaceAll]);
      parseXML := version;
    except on e: Exception do MemoUpdateMsg.Lines.Add('[' + DateTimeToStr(Now) + ']' + e.Message);
    end;
  finally
    xmlFile.Free;
    SSL.Free;
    HTTP.Free;
  end;
end;

// Запись в БД
procedure TFormMain.writeToDB(shortName, longName, period, Okud, srok, dateYtv, DateYtvLink, XMLLink, DOCLink, PDFLink: String);
begin
  try
    try
      DataModule1.FDQueryForms.SQL.Text := 'Insert into Forms (shortName, fullName, period, Okud, srok, ytvDate, ytvLink, xmlLink, xmlDate, docLink, pdfLink) Values (:Value1, :Value2, :Value3, :Value4, :Value5, :Value6, :Value7, :Value8, :Value9, :Value10, :Value11)';
      DataModule1.FDQueryForms.ParamByName('Value1').AsString := shortName;
      DataModule1.FDQueryForms.ParamByName('Value2').AsString := longName;
      DataModule1.FDQueryForms.ParamByName('Value3').AsString := period;
      DataModule1.FDQueryForms.ParamByName('Value4').AsString := Okud;
      DataModule1.FDQueryForms.ParamByName('Value5').AsString := srok;
      DataModule1.FDQueryForms.ParamByName('Value6').AsString := dateYtv;
      if length(dateYtvLink) > 0 then DataModule1.FDQueryForms.ParamByName('Value7').AsString := 'https://rosstat.gov.ru' + dateYtvLink
      else DataModule1.FDQueryForms.ParamByName('Value7').AsString := '';
      if length(XMLLink) > 0 then DataModule1.FDQueryForms.ParamByName('Value8').AsString := 'https://rosstat.gov.ru' + XMLLink
      else DataModule1.FDQueryForms.ParamByName('Value8').AsString := '';
      if length(XMLLink) > 0 then DataModule1.FDQueryForms.ParamByName('Value9').AsString := parseXML('https://rosstat.gov.ru' + XMLLink)
      else DataModule1.FDQueryForms.ParamByName('Value9').AsString := '';
      if length(DOCLink) > 0 then DataModule1.FDQueryForms.ParamByName('Value10').AsString := 'https://rosstat.gov.ru' + DOCLink
      else DataModule1.FDQueryForms.ParamByName('Value10').AsString := '';
      if length(PDFLink) > 0 then DataModule1.FDQueryForms.ParamByName('Value11').AsString := 'https://rosstat.gov.ru' + PDFLink
      else DataModule1.FDQueryForms.ParamByName('Value11').AsString := '';
      DataModule1.FDQueryForms.ExecSQL;
    except on e:Exception do MemoUpdateMsg.Lines.Add('[' + DateTimeToStr(Now) + ']' + e.Message);

    end;
  finally
    DataModule1.FDQueryForms.Close;
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

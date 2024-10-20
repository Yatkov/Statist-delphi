unit UnitFormPreview;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, XmlIntf, XmlDoc,
  Vcl.StdCtrls, Vcl.Grids, Math;

type
  TFormPreview = class(TForm)
    PageControlPreview: TPageControl;
    TabSheetPreview: TTabSheet;
    PopupMenu: TPopupMenu;
    NClosePage: TMenuItem;
    ListBoxSections: TListBox;
    ScrollBoxPreview: TScrollBox;
    procedure NClosePageClick(Sender: TObject);
    procedure StringGridPreviewDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
    var arrStringGridFormPreview: array of TStringGrid;
        arrLabelFormPreview: array of TLabel;
  public
    { Public declarations }
    procedure xmlPreview(xmlLink: string);
  end;

var
  FormPreview: TFormPreview;

implementation

{$R *.dfm}

uses UnitFormUtils, Main;

procedure TFormPreview.NClosePageClick(Sender: TObject);
begin
  if PageControlPreview.ActivePageIndex >= 0 then PageControlPreview.ActivePage.Destroy;
end;

// Отрисовка ячеек
procedure TFormPreview.StringGridPreviewDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);
begin
  with TStringGrid(Sender) do
    if Pos(#13#10, Cells[ACol, ARow]) > 0 then
    begin
      Canvas.FillRect(Rect);
      Inc(Rect.Left, 2);
      Inc(Rect.Top, 2);
      DrawText(Canvas.Handle, PChar(Cells[ACol, ARow]), -1, Rect,
        DT_NOPREFIX or DT_WORDBREAK);
    end;
end;

// Создание предпросмотра
procedure TFormPreview.xmlPreview(xmlLink: string);
var XMLDoc: IXMLDocument;
    metaFormNode, sections, section, columns, rows: IXMLNode;
    xmlFile: TFileStream;
    sectionCount, colCount, rowCount: Integer;
begin
  XMLDoc := TXMLDocument.Create(nil);
  xmlFile := TFileStream.Create('a.xml', fmCreate);
  try
    XMLDoc.LoadFromStream(downloadXML(xmlLink));
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

      arrLabelFormPreview[i] := TLabel.Create(ScrollBoxPreview);
      arrLabelFormPreview[i].parent := ScrollBoxPreview;
      arrLabelFormPreview[i].Height := 25;
      if i = 0 then arrLabelFormPreview[i].Top :=  15
      else arrLabelFormPreview[i].Top := arrStringGridFormPreview[i-1].Top + arrStringGridFormPreview[i-1].Height + 15;
      arrLabelFormPreview[i].Caption := section.Attributes['name'];
      arrLabelFormPreview[i].Font.Name := 'Montserrat';

      ListBoxSections.Items.Add(arrLabelFormPreview[i].Caption);

      arrStringGridFormPreview[i] := TStringGrid.Create(ScrollBoxPreview);
      arrStringGridFormPreview[i].Parent := ScrollBoxPreview;
      arrStringGridFormPreview[i].Font.Size := 8;
      arrStringGridFormPreview[i].top := arrLabelFormPreview[i].Top + 25;
      arrStringGridFormPreview[i].left := 10;
      arrStringGridFormPreview[i].ColCount := colCount;
      arrStringGridFormPreview[i].RowCount := rowCount;
      arrStringGridFormPreview[i].FixedCols := 0;
      arrStringGridFormPreview[i].FixedRows := 2;
      arrStringGridFormPreview[i].Width := PageControlPreview.Pages[PageControlPreview.ActivePageIndex].Width - arrStringGridFormPreview[i].left - 20;
      arrStringGridFormPreview[i].Height := rowCount * arrStringGridFormPreview[i].RowHeights[0];
      arrStringGridFormPreview[i].Options := [goColSizing];
      //arrStringGridFormPreview[i].OnMouseWheelDown := ScrollBoxFormPreviewMouseWheelDown;
      //arrStringGridFormPreview[i].OnMouseWheelUp := ScrollBoxFormPreviewMouseWheelUp;
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
      //arrStringGridFormPreview[i].DefaultDrawing := False;

      for var col := 0 to colCount-1 do begin
        arrStringGridFormPreview[i].ColWidths[col] := 150;
      end;
      arrStringGridFormPreview[i].RowHeights[0] := 50;

      for var col := 0 to colCount-1 do begin
        arrStringGridFormPreview[i].Cells[col, 0] := columns.ChildNodes[col].Attributes['name'];
        arrStringGridFormPreview[i].Cells[col, 1] := columns.ChildNodes[col].Attributes['code'];
        //arrStringGridFormPreview[i].ColWidths[col] := arrStringGridFormPreview[i].Canvas.TextWidth(arrStringGridFormPreview[i].Cells[col, 0]) + 20;
      end;

      //var maxColSize := 0;
      for var row := 0 to rowCount-3 do begin
        arrStringGridFormPreview[i].Cells[0, row+2] := rows.ChildNodes[row].Attributes['name'];
        arrStringGridFormPreview[i].Cells[1, row+2] := rows.ChildNodes[row].Attributes['code'];
        //if arrStringGridFormPreview[i].Canvas.TextWidth(arrStringGridFormPreview[i].Cells[0, row+2]) > maxColSize then maxColSize := arrStringGridFormPreview[i].Canvas.TextWidth(arrStringGridFormPreview[i].Cells[0, row+2]);
      end;
      arrStringGridFormPreview[i].Cells[1, 0] := 'Тестовый текст для' +#13#10+'теста переноса строк';
      //arrStringGridFormPreview[i].ColWidths[0] := maxColSize + 40;
      arrStringGridFormPreview[i].OnDrawCell := StringGridPreviewDrawCell;
    end;
  finally
    xmlFile.Free;
  end;
end;

end.

unit UnitFormPreview;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, XmlIntf, XmlDoc,
  Vcl.StdCtrls, Vcl.Grids, Math;

type
  TFormPreview = class(TForm)
    PageControlPreview: TPageControl;
    TabSheetForm: TTabSheet;
    PopupMenu: TPopupMenu;
    NClosePage: TMenuItem;
    ListBoxSections: TListBox;
    ScrollBoxPreview: TScrollBox;
    PageControlForm: TPageControl;
    TabSheetPreview: TTabSheet;
    TabSheetVerification: TTabSheet;
    TabSheetStuff: TTabSheet;
    procedure NClosePageClick(Sender: TObject);
    procedure StringGridPreviewDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure ListBoxSectionsClick(Sender: TObject);
    procedure ScrollBoxPreviewMouseWheelDown(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure ScrollBoxPreviewMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
    var arrStringGridFormPreview: array of TStringGrid;
        arrLabelFormPreview: array of TLabel;
    function InsertLineBreaks(const Input: string; MaxLineLength: Integer): string;
  public
    { Public declarations }
    procedure xmlPreview(xmlLink: string);
  end;

var
  FormPreview: TFormPreview;

implementation

{$R *.dfm}

uses UnitFormUtils, Main;

//Переход по разделам формы при предпросмотре
procedure TFormPreview.ListBoxSectionsClick(Sender: TObject);
var top, height: Integer;
begin
  if ListBoxSections.ItemIndex >= 0 then begin
    top := arrLabelFormPreview[ListBoxSections.ItemIndex].Top + ScrollBoxPreview.VertScrollBar.Position;
    height := arrLabelFormPreview[ListBoxSections.ItemIndex].Height;
    if top < 0 then ScrollBoxPreview.VertScrollBar.Position := 0
    else if top + ScrollBoxPreview.Height > ScrollBoxPreview.ClientHeight then ScrollBoxPreview.VertScrollBar.Position := top - ScrollBoxPreview.ClientHeight + ScrollBoxPreview.Height;
  end;
end;

procedure TFormPreview.NClosePageClick(Sender: TObject);
begin
  if PageControlPreview.ActivePageIndex >= 0 then PageControlPreview.ActivePage.Destroy;
end;

// Прокрутка окна предпросмотра формы
procedure TFormPreview.ScrollBoxPreviewMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  ScrollBoxPreview.VertScrollBar.Position := ScrollBoxPreview.VertScrollBar.Position + ScrollBoxPreview.VertScrollBar.Increment + 15;
  Handled := True;
end;

procedure TFormPreview.ScrollBoxPreviewMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  ScrollBoxPreview.VertScrollBar.Position := ScrollBoxPreview.VertScrollBar.Position - ScrollBoxPreview.VertScrollBar.Increment - 15;
  Handled := True;
end;

// Отрисовка ячеек
procedure TFormPreview.StringGridPreviewDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);
begin
  with TStringGrid(Sender) do begin
    Rect.Top := 2;
    if Pos(#13#10, Cells[ACol, ARow]) > 0 then
    begin
      Canvas.Brush.Color := $002B2B2B;
      Canvas.FillRect(Rect);
      Inc(Rect.Left, 2);
      //Inc(Rect.Top, Rect.Height div 4);
      //Rect.top := Rect.Height div 4;
      DrawText(Canvas.Handle, PChar(Cells[ACol, ARow]), -1, Rect, DT_NOPREFIX or DT_WORDBREAK);
    end;
  end;
end;

// Создание предпросмотра
procedure TFormPreview.xmlPreview(xmlLink: string);
var XMLDoc: IXMLDocument;
    metaFormNode, sections, section, columns, rows: IXMLNode;
    xmlFile: TFileStream;
    sectionCount, colCount, rowCount, maxCellHeightMultiplier: Integer;
begin
  XMLDoc := TXMLDocument.Create(nil);
  xmlFile := TFileStream.Create('a.xml', fmCreate);
  try
    XMLDoc.LoadFromStream(downloadXML(xmlLink));
    metaFormNode := xmlDoc.DocumentElement;
    sections := metaFormNode.ChildNodes['sections'];
    sectionCount := sections.ChildNodes.Count;
    maxCellHeightMultiplier := 1;
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
      arrStringGridFormPreview[i].Options := [goColSizing];
      arrStringGridFormPreview[i].OnMouseWheelDown := ScrollBoxPreviewMouseWheelDown;
      arrStringGridFormPreview[i].OnMouseWheelUp := ScrollBoxPreviewMouseWheelUp;
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
        arrStringGridFormPreview[i].ColWidths[col] := 160;
      end;

      var breakCount := 0;
      for var col := 0 to colCount-1 do begin
        arrStringGridFormPreview[i].Cells[col, 0] := InsertLineBreaks(columns.ChildNodes[col].Attributes['name'], 25);
        for var j := 0 to length(arrStringGridFormPreview[i].Cells[col, 0])-1 do begin
          if arrStringGridFormPreview[i].Cells[col, 0].Chars[j] = #13 then inc(breakCount);
        end;
        if breakCount > maxCellHeightMultiplier then maxCellHeightMultiplier := breakCount;
        breakCount := 0;
        arrStringGridFormPreview[i].Cells[col, 1] := columns.ChildNodes[col].Attributes['code'];
        //arrStringGridFormPreview[i].ColWidths[col] := arrStringGridFormPreview[i].Canvas.TextWidth(arrStringGridFormPreview[i].Cells[col, 0]) + 20;
      end;
      arrStringGridFormPreview[i].RowHeights[0] := 20 * maxCellHeightMultiplier;
      arrStringGridFormPreview[i].Height := (rowCount-1) * arrStringGridFormPreview[i].RowHeights[1] + arrStringGridFormPreview[i].RowHeights[0] + 20;
      //var maxColSize := 0;
      for var row := 0 to rowCount-3 do begin
        arrStringGridFormPreview[i].Cells[0, row+2] := rows.ChildNodes[row].Attributes['name'];
        arrStringGridFormPreview[i].Cells[1, row+2] := rows.ChildNodes[row].Attributes['code'];
        //if arrStringGridFormPreview[i].Canvas.TextWidth(arrStringGridFormPreview[i].Cells[0, row+2]) > maxColSize then maxColSize := arrStringGridFormPreview[i].Canvas.TextWidth(arrStringGridFormPreview[i].Cells[0, row+2]);
      end;
      //arrStringGridFormPreview[i].ColWidths[0] := maxColSize + 40;
      arrStringGridFormPreview[i].OnDrawCell := StringGridPreviewDrawCell;
    end;
  finally
    xmlFile.Free;
  end;
end;

function TFormPreview.InsertLineBreaks(const Input: string; MaxLineLength: Integer): string;
var
  Words: TArray<string>;
  CurrentLine: string;
  i: Integer;
begin
  Result := '';
  CurrentLine := '';

  // Разделяем входной текст на слова
  Words := Input.Split([' ']);

  for i := 0 to High(Words) do
  begin
    // Проверяем, можно ли добавить текущее слово к текущей строке
    if Length(CurrentLine) + Length(Words[i]) + 1 <= MaxLineLength then
    begin
      // Если текущая строка не пустая, добавляем пробел перед словом
      if CurrentLine <> '' then
        CurrentLine := CurrentLine + ' ';
      CurrentLine := CurrentLine + Words[i];
    end
    else
    begin
      // Добавляем текущую строку к результату и переносим строку
      if CurrentLine <> '' then
      begin
        Result := Result + CurrentLine + #13#10;
        CurrentLine := Words[i]; // Начинаем новую строку с текущего слова
      end
      else
      begin
        // Если текущее слово больше максимальной длины, просто переносим его
        Result := Result + Words[i] + #13#10;
      end;
    end;
  end;

  // Добавляем последнюю строку, если она не пустая
  if CurrentLine <> '' then
    Result := Result + CurrentLine;

end;

end.

unit DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, Vcl.Forms, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, DBGrids;

type
  TDataModule1 = class(TDataModule)
    FDConRosstatForm: TFDConnection;
    FDTableForms: TFDTable;
    FDQueryForms: TFDQuery;
    DataSource1: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    var fSortColumn: string;
        fSortDirection: boolean;
    procedure DBConnect();
  public
    { Public declarations }
    procedure writeToDB(shortName, longName, period, Okud, srok, dateYtv, DateYtvLink, XMLLink, DOCLink, PDFLink: String);
    procedure columnSort(Column: TColumn);
    procedure columnUnsort();
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Main;

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  DBConnect();
end;

procedure TDataModule1.DBConnect();
begin
  FDConRosstatForm.close;
  try
    FDConRosstatForm.DriverName := 'SQLite';
    FDConRosstatForm.ConnectionName := ExtractFilePath(Application.ExeName) + 'db/RosstatForms.db';
    FDConRosstatForm.Params.DriverID := 'SQLite';
    FDConRosstatForm.Params.Database := ExtractFilePath(Application.ExeName) + 'db/RosstatForms.db';
    FDTableForms.ConnectionName := FDConRosstatForm.ConnectionName;
    FDTableForms.TableName := 'Forms';
    FDQueryForms.ConnectionName :=  FDConRosstatForm.ConnectionName;
    FDQueryForms.Connection := FDConRosstatForm;
  finally

  end;
end;

procedure TDataModule1.writeToDB(shortName, longName, period, Okud, srok, dateYtv, DateYtvLink, XMLLink, DOCLink, PDFLink: String);
begin
  try
    FDQueryForms.SQL.Text := 'Insert into Forms (shortName, fullName, period, Okud, srok, ytvDate, ytvLink, xmlLink, xmlDate, docLink, pdfLink) Values (:Value1, :Value2, :Value3, :Value4, :Value5, :Value6, :Value7, :Value8, :Value9, :Value10, :Value11)';
    FDQueryForms.ParamByName('Value1').AsString := shortName;
    FDQueryForms.ParamByName('Value2').AsString := longName;
    FDQueryForms.ParamByName('Value3').AsString := period;
    FDQueryForms.ParamByName('Value4').AsString := Okud;
    FDQueryForms.ParamByName('Value5').AsString := srok;
    FDQueryForms.ParamByName('Value6').AsString := dateYtv;
    if length(dateYtvLink) > 0 then FDQueryForms.ParamByName('Value7').AsString := 'https://rosstat.gov.ru' + dateYtvLink
    else FDQueryForms.ParamByName('Value7').AsString := '';
    if length(XMLLink) > 0 then FDQueryForms.ParamByName('Value8').AsString := 'https://rosstat.gov.ru' + XMLLink
    else FDQueryForms.ParamByName('Value8').AsString := '';
    //if length(XMLLink) > 0 then FDQueryForms.ParamByName('Value9').AsString := parseXML('https://rosstat.gov.ru' + XMLLink)
    //else FDQueryForms.ParamByName('Value9').AsString := '';
    if length(DOCLink) > 0 then FDQueryForms.ParamByName('Value10').AsString := 'https://rosstat.gov.ru' + DOCLink
    else FDQueryForms.ParamByName('Value10').AsString := '';
    if length(PDFLink) > 0 then FDQueryForms.ParamByName('Value11').AsString := 'https://rosstat.gov.ru' + PDFLink
    else FDQueryForms.ParamByName('Value11').AsString := '';
    FDQueryForms.ExecSQL;
  finally
    FDQueryForms.Close;
  end;
end;

procedure TDataModule1.columnSort(Column: TColumn);
var sortOrder: string;
    columnIntex: integer;
begin
  if fSortColumn = Column.FieldName then
  fSortDirection := not fSortDirection
 else begin
  //for var i := 0 to DataModule1.FDTableForms.FieldCount-1 do
    //if Pos('↓',DBGridForms.Columns[i].FieldName) > 0 then
      //DBGridForms.Columns[i].Title.Caption := Copy(DBGridForms.Columns[i].Title.Caption, 1, Length(DBGridForms.Columns[i].Title.Caption)-2);
  fSortColumn := Column.FieldName;
  fSortDirection := True;
 end;

 if fSortDirection then sortOrder := 'A'
 else sortOrder := 'D';

 FDTableForms.Close;
 if FDTableForms.IndexFieldNames <> '' then FormMain.DBGridForms.Columns[Column.Index].Title.Caption := Copy(FormMain.DBGridForms.Columns[Column.Index].Title.Caption, 1, Length(FormMain.DBGridForms.Columns[Column.Index].Title.Caption)-2);
 FDTableForms.IndexFieldNames := fSortColumn + ':' + sortOrder;

 if sortOrder = 'A' then FormMain.DBGridForms.Columns[Column.Index].Title.Caption := FormMain.DBGridForms.Columns[Column.Index].Title.Caption + ' ↓';
 if sortOrder = 'D' then FormMain.DBGridForms.Columns[Column.Index].Title.Caption := FormMain.DBGridForms.Columns[Column.Index].Title.Caption + ' ↑';

 FDTableForms.Open;
end;

procedure TDataModule1.columnUnsort();
var sortingRecord: string;
begin
  fSortColumn := '';
  fSortDirection := True;
  FDTableForms.Close;
  sortingRecord := copy(FDTableForms.IndexFieldNames, 1, Length(FDTableForms.IndexFieldNames)-2);
  FDTableForms.IndexFieldNames := '';
  FDTableForms.Open;

  for var i := 0 to DataModule1.FDTableForms.FieldCount-1 do begin
    if FormMain.DBGridForms.Columns[i].FieldName = sortingRecord then begin
      FormMain.DBGridForms.Columns[i].Title.Caption := Copy(FormMain.DBGridForms.Columns[i].Title.Caption, 1, Length(FormMain.DBGridForms.Columns[i].Title.Caption)-2);
      break;
    end;
  end;
end;

end.

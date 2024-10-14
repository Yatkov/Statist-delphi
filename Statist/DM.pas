unit DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, Vcl.Forms, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDataModule1 = class(TDataModule)
    FDConRosstatForm: TFDConnection;
    FDTableForms: TFDTable;
    FDQueryForms: TFDQuery;
    DataSource1: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure DBConnect();
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

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

end.

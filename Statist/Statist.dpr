program Statist;

uses
  Vcl.Forms,
  Main in 'Main.pas' {FormMain},
  Vcl.Themes,
  Vcl.Styles,
  DM in 'DM.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glossy');
  Application.Title := '�������';
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.

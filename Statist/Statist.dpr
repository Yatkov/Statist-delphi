program Statist;

uses
  Vcl.Forms,
  Main in 'Main.pas' {FormMain},
  Vcl.Themes,
  Vcl.Styles,
  DM in 'DM.pas' {DataModule1: TDataModule},
  TGBot in 'TGBot.pas',
  UnitUpdate in 'UnitUpdate.pas' {FormUpdate};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glossy');
  Application.Title := 'Статист';
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFormMain, FormMain);
  //Application.CreateForm(TFormUpdate, FormUpdate);
  Application.Run;
end.

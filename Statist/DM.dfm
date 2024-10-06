object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 200
  Width = 399
  object FDConRosstatForm: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 64
    Top = 16
  end
end

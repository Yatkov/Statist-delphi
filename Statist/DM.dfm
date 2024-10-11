object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 124
  Width = 499
  PixelsPerInch = 120
  object FDConRosstatForm: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 80
    Top = 20
  end
  object FDTableForms: TFDTable
    Connection = FDConRosstatForm
    Left = 224
    Top = 16
  end
  object FDQueryForms: TFDQuery
    Connection = FDConRosstatForm
    Left = 336
    Top = 16
  end
end

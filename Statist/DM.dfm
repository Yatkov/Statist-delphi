object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 99
  Width = 547
  object FDConRosstatForm: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 64
    Top = 16
  end
  object FDTableForms: TFDTable
    Connection = FDConRosstatForm
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 250
    Left = 179
    Top = 13
  end
  object FDQueryForms: TFDQuery
    Connection = FDConRosstatForm
    FetchOptions.AssignedValues = [evRowsetSize]
    Left = 269
    Top = 13
  end
  object DataSource1: TDataSource
    DataSet = FDTableForms
    Left = 368
    Top = 16
  end
end

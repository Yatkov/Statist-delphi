object FormCheckOrg: TFormCheckOrg
  Left = 0
  Top = 0
  BorderWidth = 1
  Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102
  ClientHeight = 739
  ClientWidth = 1097
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Montserrat'
  Font.Style = []
  Position = poDesigned
  StyleName = 'Windows10 Dark'
  OnCreate = FormCreate
  OnEndDock = FormEndDock
  TextHeight = 21
  object Splitter1: TSplitter
    Left = 561
    Top = 44
    Width = 8
    Height = 695
    Beveled = True
    ResizeStyle = rsLine
    ExplicitTop = 0
    ExplicitHeight = 739
  end
  object LabelOrgCount: TLabel
    Left = 0
    Top = 0
    Width = 1097
    Height = 18
    Align = alTop
    Caption = #1047#1072#1087#1080#1089#1077#1081' '#1085#1072#1081#1076#1077#1085#1086':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Montserrat Medium'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 12
    ExplicitWidth = 1006
  end
  object PanelOrgHeader: TPanel
    Left = 0
    Top = 44
    Width = 561
    Height = 695
    Align = alLeft
    BevelOuter = bvLowered
    Color = clBtnHighlight
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    ParentBackground = False
    TabOrder = 0
    StyleName = 'Glossy'
    ExplicitTop = 0
    ExplicitHeight = 739
    DesignSize = (
      561
      695)
    object LabelInnCaption: TLabel
      Left = 6
      Top = 136
      Width = 33
      Height = 18
      Cursor = crHelp
      Hint = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1085#1072#1083#1086#1075#1086#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
      Caption = #1048#1053#1053
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Montserrat'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object LabelOkpoCaption: TLabel
      Left = 6
      Top = 171
      Width = 43
      Height = 18
      Cursor = crHelp
      Hint = 
        #1054#1050#1055#1054' / '#1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1058#1054#1057#1055': '#1054#1073#1097#1077#1088#1086#1089#1089#1080#1081#1089#1082#1080#1081' '#1082#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086 +
        #1088' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1081' '#1080' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081' - '#1086#1089#1085#1086#1074#1085#1086#1081' '#1082#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088' '#1093#1086#1079#1103#1081#1089#1090#1074#1091#1102#1097 +
        #1080#1093' '#1089#1091#1073#1098#1077#1082#1090#1086#1074' '#1056#1086#1089#1089#1080#1080': '#1082#1086#1084#1087#1072#1085#1080#1081' '#1080' '#1080#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1093' '#1087#1088#1077#1076#1087#1088#1080#1085#1080#1084#1072#1090#1077#1083#1077#1081
      Caption = #1054#1050#1055#1054
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Montserrat'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object LabelOgrnCaption: TLabel
      Left = 6
      Top = 206
      Width = 39
      Height = 18
      Cursor = crHelp
      Hint = 
        #1054#1089#1085#1086#1074#1085#1086#1081' '#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1077#1085#1085#1099#1081' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088' - '#1085#1086#1084#1077#1088' '#1079#1072#1087#1080#1089#1080' '#1086' ' +
        #1089#1086#1079#1076#1072#1085#1080#1080' '#1102#1088#1080#1076#1080#1095#1077#1089#1082#1086#1075#1086' '#1083#1080#1094#1072
      Caption = #1054#1043#1056#1053
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Montserrat'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object MemoOrgName: TMemo
      Left = 6
      Top = 6
      Width = 549
      Height = 80
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 2105376
      EditMargins.Auto = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Montserrat Medium'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      StyleName = 'Windows'
      ExplicitTop = 50
    end
    object EditOkpo: TEdit
      Left = 94
      Top = 165
      Width = 461
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 2105376
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Montserrat'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      StyleName = 'Windows'
    end
    object EditOgrn: TEdit
      Left = 94
      Top = 200
      Width = 461
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 2105376
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Montserrat'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      StyleName = 'Windows'
    end
    object EditInn: TEdit
      Left = 94
      Top = 130
      Width = 461
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 2105376
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Montserrat'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      StyleName = 'Windows'
    end
  end
  object StringGridOrgForms: TStringGrid
    Left = 569
    Top = 44
    Width = 528
    Height = 695
    Align = alClient
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect, goFixedRowDefAlign]
    TabOrder = 1
    StyleName = 'Glossy'
    OnDblClick = StringGridOrgFormsDblClick
    ExplicitLeft = 0
    ExplicitTop = 168
    ExplicitWidth = 1018
    ExplicitHeight = 572
    ColWidths = (
      266
      115
      229)
  end
  object ComboBoxOrgs: TComboBox
    Left = 0
    Top = 18
    Width = 1097
    Height = 26
    Align = alTop
    Style = csDropDownList
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Montserrat Medium'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    TextHint = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
    ExplicitLeft = 6
    ExplicitTop = 6
    ExplicitWidth = 549
  end
  object IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 96
    Top = 680
  end
  object SSL: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvTLSv1_2
    SSLOptions.SSLVersions = [sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 200
    Top = 672
  end
end

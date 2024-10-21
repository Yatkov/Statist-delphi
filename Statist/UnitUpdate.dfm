object FormUpdate: TFormUpdate
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1092#1086#1088#1084
  ClientHeight = 735
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  TextHeight = 15
  object PageControlUpdate: TPageControl
    Left = 0
    Top = 0
    Width = 491
    Height = 582
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1057#1087#1080#1089#1086#1082' '#1092#1086#1088#1084
      object PanelControl: TPanel
        Left = 0
        Top = 445
        Width = 483
        Height = 107
        Align = alBottom
        TabOrder = 0
        DesignSize = (
          483
          107)
        object LabelUpdateHelp1: TLabel
          Left = 223
          Top = 6
          Width = 64
          Height = 35
          Cursor = crHelp
          Hint = 
            #1059' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1093' '#1092#1086#1088#1084' '#1074#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1087#1086#1080#1089#1082' xml '#1092#1072#1081#1083#1086#1074'. '#1055#1086#1089#1083#1077' '#1101#1090#1086#1075#1086' '#1089#1088#1072#1074 +
            #1085#1080#1074#1072#1077#1090#1089#1103' '#1074#1077#1088#1089#1080#1103' '#1092#1086#1088#1084#1099' '#1074' '#1092#1072#1081#1083#1077' '#1080' '#1074#1077#1088#1089#1080#1103', '#1082#1086#1090#1086#1088#1072#1103' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = '?'
          ParentShowHint = False
          ShowHint = True
          Layout = tlCenter
          ExplicitWidth = 35
        end
        object Label1: TLabel
          Left = 223
          Top = 47
          Width = 64
          Height = 17
          Cursor = crHelp
          Hint = #1042#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1093' '#1092#1086#1088#1084' '#1073#1077#1079' '#1087#1088#1086#1074#1077#1088#1082#1080
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = '?'
          ParentShowHint = False
          ShowHint = True
          Layout = tlCenter
          ExplicitWidth = 35
        end
        object ButtonCheckForms: TButton
          Left = 3
          Top = 6
          Width = 243
          Height = 35
          Anchors = [akLeft, akTop, akRight]
          Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1072#1082#1090#1091#1072#1083#1100#1085#1086#1089#1090#1100' '#1092#1086#1088#1084
          TabOrder = 0
          OnClick = ButtonCheckFormsClick
        end
        object ButtonForceUpdate: TButton
          Left = 3
          Top = 70
          Width = 243
          Height = 35
          Anchors = [akLeft, akTop, akRight]
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1092#1086#1088#1084#1099
          Enabled = False
          TabOrder = 1
          OnClick = ButtonForceUpdateClick
        end
        object CheckBoxForceUpdate: TCheckBox
          Left = 3
          Top = 47
          Width = 243
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = #1055#1088#1080#1085#1091#1076#1080#1090#1077#1083#1100#1085#1086#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
          TabOrder = 2
          OnClick = CheckBoxForceUpdateClick
        end
        object ButtonForward: TButton
          Left = 344
          Top = 72
          Width = 91
          Height = 25
          Caption = '>>'
          TabOrder = 3
          OnClick = ButtonBackClick
        end
      end
      object PanelForms: TPanel
        Left = 0
        Top = 0
        Width = 483
        Height = 445
        Align = alClient
        TabOrder = 1
        object GroupBoxForms: TGroupBox
          Left = 1
          Top = 51
          Width = 481
          Height = 393
          Align = alClient
          Caption = #1042#1099#1073#1086#1088' '#1092#1086#1088#1084' '#1085#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
          TabOrder = 0
          object CheckListBoxForms: TCheckListBox
            Left = 2
            Top = 17
            Width = 477
            Height = 374
            Align = alClient
            TabOrder = 0
          end
        end
        object PanelFormsHeader: TPanel
          Left = 1
          Top = 1
          Width = 481
          Height = 50
          Align = alTop
          TabOrder = 1
          object LabelRecordCount: TLabel
            Left = 205
            Top = 25
            Width = 275
            Height = 24
            Align = alClient
            Layout = tlCenter
            ExplicitWidth = 3
            ExplicitHeight = 15
          end
          object CheckBoxSelectAllForms: TCheckBox
            Left = 1
            Top = 1
            Width = 479
            Height = 24
            Align = alTop
            Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077' '#1092#1086#1088#1084#1099
            TabOrder = 0
            OnClick = CheckBoxSelectAllFormsClick
          end
          object EditFindForm: TEdit
            Left = 1
            Top = 25
            Width = 184
            Height = 24
            Align = alLeft
            TabOrder = 1
            TextHint = #1055#1086#1080#1089#1082' '#1087#1086' '#1092#1086#1088#1084#1072#1084'...'
            OnChange = EditFindFormChange
            ExplicitHeight = 23
          end
          object SpinButtonChangeRecord: TSpinButton
            Left = 185
            Top = 25
            Width = 20
            Height = 24
            Align = alLeft
            DownGlyph.Data = {
              0E010000424D0E01000000000000360000002800000009000000060000000100
              200000000000D800000000000000000000000000000000000000008080000080
              8000008080000080800000808000008080000080800000808000008080000080
              8000008080000080800000808000000000000080800000808000008080000080
              8000008080000080800000808000000000000000000000000000008080000080
              8000008080000080800000808000000000000000000000000000000000000000
              0000008080000080800000808000000000000000000000000000000000000000
              0000000000000000000000808000008080000080800000808000008080000080
              800000808000008080000080800000808000}
            TabOrder = 2
            UpGlyph.Data = {
              0E010000424D0E01000000000000360000002800000009000000060000000100
              200000000000D800000000000000000000000000000000000000008080000080
              8000008080000080800000808000008080000080800000808000008080000080
              8000000000000000000000000000000000000000000000000000000000000080
              8000008080000080800000000000000000000000000000000000000000000080
              8000008080000080800000808000008080000000000000000000000000000080
              8000008080000080800000808000008080000080800000808000000000000080
              8000008080000080800000808000008080000080800000808000008080000080
              800000808000008080000080800000808000}
            OnDownClick = SpinButtonChangeRecordDownClick
            OnUpClick = SpinButtonChangeRecordUpClick
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1060#1086#1088#1084#1099' '#1082' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1102
      ImageIndex = 1
      object PanelActual: TPanel
        Left = 0
        Top = 0
        Width = 483
        Height = 552
        Align = alClient
        TabOrder = 0
        object LabelActualCount: TLabel
          Left = 1
          Top = 1
          Width = 481
          Height = 15
          Align = alTop
          Caption = #1053#1072#1081#1076#1077#1085#1086' '#1092#1086#1088#1084' '#1082' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1102':'
          ExplicitWidth = 169
        end
        object StringGridActualForms: TStringGrid
          Left = 1
          Top = 16
          Width = 481
          Height = 453
          Align = alClient
          ColCount = 4
          FixedCols = 0
          TabOrder = 0
          ColWidths = (
            121
            99
            116
            107)
        end
        object PanelActualControl: TPanel
          Left = 1
          Top = 469
          Width = 481
          Height = 82
          Align = alBottom
          TabOrder = 1
          DesignSize = (
            481
            82)
          object ButtonUpdate: TButton
            Left = 8
            Top = 6
            Width = 254
            Height = 35
            Anchors = [akLeft, akTop, akRight]
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1085#1077#1072#1082#1090#1091#1072#1083#1100#1085#1099#1077
            TabOrder = 0
          end
          object ButtonBack: TButton
            Left = 8
            Top = 47
            Width = 126
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            Caption = '<< '#1053#1072#1079#1072#1076
            TabOrder = 1
            OnClick = ButtonBackClick
          end
        end
      end
    end
  end
  object MemoMsg: TMemo
    Left = 0
    Top = 582
    Width = 491
    Height = 153
    Align = alBottom
    PopupMenu = PopupMenuClearMsg
    TabOrder = 1
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 28
    Top = 610
  end
  object IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 184
    Top = 632
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
    Left = 296
    Top = 624
  end
  object PopupMenuClearMsg: TPopupMenu
    Left = 317
    Top = 389
    object NClearMsg: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1083#1086#1075#1080
      OnClick = NClearMsgClick
    end
  end
end

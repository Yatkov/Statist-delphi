object FormUpdate: TFormUpdate
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1092#1086#1088#1084
  ClientHeight = 578
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  OnCreate = FormCreate
  TextHeight = 15
  object PageControlUpdate: TPageControl
    Left = 0
    Top = 0
    Width = 462
    Height = 489
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 352
    object TabSheet1: TTabSheet
      Caption = #1057#1087#1080#1089#1086#1082' '#1092#1086#1088#1084
      object PanelControl: TPanel
        Left = 0
        Top = 352
        Width = 454
        Height = 107
        Align = alBottom
        TabOrder = 0
        DesignSize = (
          454
          107)
        object LabelUpdateHelp1: TLabel
          Left = 223
          Top = 6
          Width = 35
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
        end
        object Label1: TLabel
          Left = 223
          Top = 47
          Width = 35
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
        end
        object ButtonCheckActual: TButton
          Left = 3
          Top = 6
          Width = 214
          Height = 35
          Anchors = [akLeft, akTop, akRight]
          Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1072#1082#1090#1091#1072#1083#1100#1085#1086#1089#1090#1100' '#1092#1086#1088#1084
          TabOrder = 0
        end
        object ButtonForceUpdate: TButton
          Left = 3
          Top = 70
          Width = 214
          Height = 35
          Anchors = [akLeft, akTop, akRight]
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1092#1086#1088#1084#1099
          Enabled = False
          TabOrder = 1
        end
        object CheckBoxForceUpdate: TCheckBox
          Left = 3
          Top = 47
          Width = 214
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
        Width = 454
        Height = 352
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 96
        ExplicitTop = 136
        ExplicitWidth = 185
        ExplicitHeight = 41
        object GroupBoxForms: TGroupBox
          Left = 1
          Top = 57
          Width = 452
          Height = 294
          Align = alClient
          Caption = #1042#1099#1073#1086#1088' '#1092#1086#1088#1084' '#1085#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
          TabOrder = 0
          ExplicitLeft = 88
          ExplicitTop = 176
          ExplicitWidth = 185
          ExplicitHeight = 105
          object CheckListBoxForms: TCheckListBox
            Left = 2
            Top = 17
            Width = 448
            Height = 275
            Align = alClient
            TabOrder = 0
            ExplicitLeft = 264
            ExplicitTop = 152
            ExplicitWidth = 121
            ExplicitHeight = 97
          end
        end
        object PanelFormsHeader: TPanel
          Left = 1
          Top = 1
          Width = 452
          Height = 56
          Align = alTop
          TabOrder = 1
          object LabelRecordCount: TLabel
            Left = 165
            Top = 25
            Width = 286
            Height = 30
            Align = alClient
            Layout = tlCenter
            ExplicitWidth = 3
            ExplicitHeight = 15
          end
          object CheckBoxSelectAllForms: TCheckBox
            Left = 1
            Top = 1
            Width = 450
            Height = 24
            Align = alTop
            Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077' '#1092#1086#1088#1084#1099
            TabOrder = 0
            OnClick = CheckBoxSelectAllFormsClick
          end
          object EditFindForm: TEdit
            Left = 1
            Top = 25
            Width = 144
            Height = 30
            Align = alLeft
            TabOrder = 1
            TextHint = #1055#1086#1080#1089#1082' '#1087#1086' '#1092#1086#1088#1084#1072#1084'...'
            OnChange = EditFindFormChange
            ExplicitLeft = -5
            ExplicitTop = 20
          end
          object SpinButtonChangeRecord: TSpinButton
            Left = 145
            Top = 25
            Width = 20
            Height = 30
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
            ExplicitLeft = 151
            ExplicitTop = 24
            ExplicitHeight = 25
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
        Width = 454
        Height = 459
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 168
        ExplicitTop = 176
        ExplicitWidth = 185
        ExplicitHeight = 41
        object LabelActualCount: TLabel
          Left = 1
          Top = 1
          Width = 452
          Height = 15
          Align = alTop
          Caption = #1053#1072#1081#1076#1077#1085#1086' '#1092#1086#1088#1084' '#1082' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1102':'
          ExplicitWidth = 171
        end
        object StringGridActualForms: TStringGrid
          Left = 1
          Top = 16
          Width = 452
          Height = 360
          Align = alClient
          ColCount = 4
          FixedCols = 0
          TabOrder = 0
          ExplicitLeft = 168
          ExplicitTop = 128
          ExplicitWidth = 320
          ExplicitHeight = 120
          ColWidths = (
            121
            99
            116
            107)
        end
        object PanelActualControl: TPanel
          Left = 1
          Top = 376
          Width = 452
          Height = 82
          Align = alBottom
          TabOrder = 1
          DesignSize = (
            452
            82)
          object ButtonUpdate: TButton
            Left = 8
            Top = 6
            Width = 225
            Height = 35
            Anchors = [akLeft, akTop, akRight]
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1085#1077#1072#1082#1090#1091#1072#1083#1100#1085#1099#1077
            TabOrder = 0
          end
          object ButtonBack: TButton
            Left = 8
            Top = 47
            Width = 97
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
    Top = 489
    Width = 462
    Height = 89
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 358
  end
end

object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = #1057#1090#1072#1090#1080#1089#1090
  ClientHeight = 738
  ClientWidth = 1099
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Montserrat Medium'
  Font.Style = [fsBold]
  Menu = MainMenu1
  Position = poDesigned
  WindowState = wsMaximized
  StyleName = 'Windows10 Dark'
  OnCreate = FormCreate
  TextHeight = 18
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1093
    Height = 732
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    ScrollOpposite = True
    TabHeight = 30
    TabOrder = 0
    TabWidth = 170
    StyleName = 'Glossy'
    ExplicitWidth = 1091
    ExplicitHeight = 724
    object TabSheet1: TTabSheet
      Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1087#1086' '#1092#1086#1088#1084#1072#1084
      object Splitter1: TSplitter
        Left = 389
        Top = 0
        Width = 10
        Height = 692
        Beveled = True
        ResizeStyle = rsLine
        ExplicitLeft = 393
        ExplicitHeight = 710
      end
      object PanelForms: TPanel
        Left = 0
        Top = 0
        Width = 389
        Height = 692
        Align = alLeft
        TabOrder = 0
        object EditFormsFind: TEdit
          Left = 1
          Top = 42
          Width = 387
          Height = 26
          Align = alTop
          TabOrder = 0
          TextHint = #1055#1086#1080#1089#1082' '#1087#1086' '#1092#1086#1088#1084#1072#1084'...'
          OnChange = EditFormsFindChange
        end
        object PanelFormControl: TPanel
          Left = 1
          Top = 630
          Width = 387
          Height = 61
          Align = alBottom
          Padding.Left = 5
          Padding.Top = 5
          Padding.Right = 5
          Padding.Bottom = 5
          TabOrder = 1
          object LabelFormCounter: TLabel
            Left = 6
            Top = 6
            Width = 375
            Height = 18
            Align = alTop
            ExplicitWidth = 3
          end
        end
        object DBGridForms: TDBGrid
          Left = 1
          Top = 68
          Width = 387
          Height = 562
          Align = alClient
          DataSource = DataModule1.DataSource1
          Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          PopupMenu = PopupMenuSort
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Montserrat Medium'
          TitleFont.Style = [fsBold]
          OnCellClick = DBGridFormsCellClick
          OnTitleClick = DBGridFormsTitleClick
        end
        object PanelFormsSettings: TPanel
          Left = 7
          Top = 42
          Width = 251
          Height = 353
          BevelOuter = bvNone
          Padding.Left = 5
          Padding.Top = 5
          Padding.Right = 5
          Padding.Bottom = 5
          TabOrder = 3
          Visible = False
          object GroupBoxSettings1: TGroupBox
            Left = 5
            Top = 5
            Width = 241
            Height = 300
            Align = alTop
            Caption = #1054#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1087#1086#1083#1077#1081
            Padding.Left = 5
            TabOrder = 0
            object CheckListBoxFormsFields: TCheckListBox
              Left = 7
              Top = 37
              Width = 232
              Height = 226
              Align = alClient
              ItemHeight = 18
              TabOrder = 0
            end
            object CheckBoxFormsFieldsAll: TCheckBox
              Left = 7
              Top = 20
              Width = 232
              Height = 17
              Align = alTop
              Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
              TabOrder = 1
              OnClick = CheckBoxFormsFieldsAllClick
            end
            object PanelCheckBoxFormsFieldControl: TPanel
              Left = 7
              Top = 263
              Width = 232
              Height = 35
              Align = alBottom
              TabOrder = 2
              object BitBtnCheckBoxOk: TBitBtn
                Left = 1
                Top = 1
                Width = 114
                Height = 33
                Align = alLeft
                Caption = #1054#1050
                Kind = bkOK
                NumGlyphs = 2
                TabOrder = 0
                OnClick = BitBtnCheckBoxOkClick
              end
              object BitBtnCheckBoxCancel: TBitBtn
                Left = 115
                Top = 1
                Width = 116
                Height = 33
                Align = alClient
                Caption = #1054#1090#1084#1077#1085#1072
                Kind = bkCancel
                NumGlyphs = 2
                TabOrder = 1
                OnClick = BitBtnCheckBoxCancelClick
              end
            end
          end
          object ButtonUpdateForms: TButton
            Left = 5
            Top = 313
            Width = 241
            Height = 35
            Align = alBottom
            Caption = #1052#1072#1089#1090#1077#1088' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081' '#1092#1086#1088#1084
            TabOrder = 1
            OnClick = ButtonUpdateFormsClick
          end
        end
        object PanelFormsSettingsButton: TPanel
          Left = 1
          Top = 1
          Width = 387
          Height = 41
          Align = alTop
          Padding.Left = 5
          Padding.Top = 5
          Padding.Bottom = 5
          TabOrder = 4
          object ButtonFormsSettings: TButton
            Left = 6
            Top = 6
            Width = 146
            Height = 29
            Align = alLeft
            Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Montserrat Medium'
            Font.Style = [fsBold]
            ImageIndex = 0
            ImageName = '-1'
            ImageMargins.Left = 10
            Images = ImageList1
            ParentFont = False
            TabOrder = 0
            OnClick = ButtonFormsSettingsClick
          end
        end
      end
      object ScrollBoxForms: TScrollBox
        Left = 399
        Top = 0
        Width = 686
        Height = 692
        VertScrollBar.Smooth = True
        Align = alClient
        TabOrder = 1
        StyleName = 'Glossy'
        object PanelFormDownload: TPanel
          Left = 0
          Top = 0
          Width = 682
          Height = 63
          Align = alTop
          TabOrder = 0
          DesignSize = (
            682
            63)
          object ShapeFormXml: TShape
            Left = 16
            Top = 16
            Width = 81
            Height = 33
            Cursor = crHandPoint
            Anchors = [akLeft, akTop, akBottom]
            Brush.Style = bsClear
            Pen.Color = clWhite
            Shape = stRoundRect
          end
          object ShapeFormDoc: TShape
            Left = 144
            Top = 16
            Width = 81
            Height = 33
            Cursor = crHandPoint
            Anchors = [akLeft, akTop, akBottom]
            Brush.Style = bsClear
            Pen.Color = clWhite
            Shape = stRoundRect
          end
          object ShapeFormPdf: TShape
            Left = 264
            Top = 16
            Width = 81
            Height = 33
            Cursor = crHandPoint
            Anchors = [akLeft, akTop, akBottom]
            Brush.Style = bsClear
            Pen.Color = clWhite
            Shape = stRoundRect
          end
          object LabelFormXML: TLabel
            Left = 16
            Top = 16
            Width = 81
            Height = 33
            Cursor = crHandPoint
            Alignment = taCenter
            Anchors = [akLeft, akTop, akBottom]
            AutoSize = False
            Caption = 'XML'
            ParentShowHint = False
            PopupMenu = PopupMenuLinks
            ShowHint = True
            Layout = tlCenter
          end
          object LabelFormDoc: TLabel
            Left = 144
            Top = 16
            Width = 81
            Height = 33
            Cursor = crHandPoint
            Alignment = taCenter
            Anchors = [akLeft, akTop, akBottom]
            AutoSize = False
            Caption = 'DOC'
            ParentShowHint = False
            PopupMenu = PopupMenuLinks
            ShowHint = True
            Layout = tlCenter
          end
          object LabelFormPdf: TLabel
            Left = 264
            Top = 16
            Width = 81
            Height = 33
            Cursor = crHandPoint
            Alignment = taCenter
            Anchors = [akLeft, akTop, akBottom]
            AutoSize = False
            Caption = 'PDF'
            ParentShowHint = False
            PopupMenu = PopupMenuLinks
            ShowHint = True
            Layout = tlCenter
          end
        end
        object PanelFormContent: TPanel
          Left = 0
          Top = 63
          Width = 682
          Height = 625
          Align = alClient
          Padding.Left = 5
          Padding.Top = 5
          Padding.Right = 5
          Padding.Bottom = 5
          TabOrder = 1
          DesignSize = (
            682
            625)
          object LabelFormFullName: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 51
            Width = 208
            Height = 25
            Alignment = taRightJustify
            AutoSize = False
            Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1092#1086#1088#1084#1099
          end
          object LabelFormName: TLabel
            Left = 6
            Top = 6
            Width = 670
            Height = 25
            Align = alTop
            AutoSize = False
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1086#1088#1084#1099
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Montserrat'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 4
            ExplicitWidth = 549
          end
          object LabelFormOKUD: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 184
            Width = 208
            Height = 25
            Alignment = taRightJustify
            AutoSize = False
            Caption = #1054#1050#1059#1044
          end
          object LabelFormPeriod: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 144
            Width = 208
            Height = 25
            Alignment = taRightJustify
            AutoSize = False
            Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100
          end
          object LabelFormSrok: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 227
            Width = 208
            Height = 25
            Alignment = taRightJustify
            AutoSize = False
            Caption = #1057#1088#1086#1082' '#1089#1076#1072#1095#1080' '#1092#1086#1088#1084#1099
          end
          object EditFormFill: TEdit
            AlignWithMargins = True
            Left = 217
            Top = 371
            Width = 450
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = 1973790
            ReadOnly = True
            TabOrder = 0
            StyleName = 'Glossy'
          end
          object EditFormFullName: TEdit
            AlignWithMargins = True
            Left = 217
            Top = 329
            Width = 450
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = 1973790
            ReadOnly = True
            TabOrder = 1
            StyleName = 'Glossy'
          end
          object EditFormYtv: TEdit
            AlignWithMargins = True
            Left = 217
            Top = 411
            Width = 450
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = 1973790
            ReadOnly = True
            TabOrder = 2
            StyleName = 'Glossy'
          end
          object LinkLabelFormFill: TLinkLabel
            Left = 3
            Top = 371
            Width = 208
            Height = 22
            Alignment = taRightJustify
            AutoSize = False
            Caption = 
              '<a href="http://www.somelink.com">'#1059#1082#1072#1079#1072#1085#1080#1103' '#1087#1086' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1102' '#1092#1086#1088#1084#1099'</' +
              'a>'
            Color = clBtnFace
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Montserrat'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 3
            UseVisualStyle = True
          end
          object LinkLabelFormVersion: TLinkLabel
            Left = 3
            Top = 329
            Width = 208
            Height = 22
            Alignment = taRightJustify
            AutoSize = False
            Caption = '<a href="http://www.somelink.com">'#1042#1077#1088#1089#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' .xml</a>'
            Color = clBtnFace
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Montserrat'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 4
            UseVisualStyle = True
          end
          object LinkLabelFormYtv: TLinkLabel
            Left = 3
            Top = 411
            Width = 208
            Height = 22
            Alignment = taRightJustify
            AutoSize = False
            Caption = 
              '<a href="http://www.somelink.com">'#1055#1088#1080#1082#1072#1079' '#1086#1073' '#1091#1090#1074#1077#1088#1078#1076#1077#1085#1080#1080' '#1092#1086#1088#1084#1099'</a' +
              '>'
            Color = clBtnFace
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Montserrat'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 5
            UseVisualStyle = True
          end
          object DBMemoFormFullName: TDBMemo
            Left = 217
            Top = 51
            Width = 450
            Height = 70
            Anchors = [akLeft, akTop, akRight]
            DataSource = DataModule1.DataSource1
            ReadOnly = True
            TabOrder = 6
          end
          object DBEditFormPeriod: TDBEdit
            Left = 217
            Top = 141
            Width = 450
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            DataSource = DataModule1.DataSource1
            ReadOnly = True
            TabOrder = 7
          end
          object DBEditFormOKUD: TDBEdit
            Left = 217
            Top = 184
            Width = 450
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            DataSource = DataModule1.DataSource1
            ReadOnly = True
            TabOrder = 8
          end
          object DBMemoFormSrok: TDBMemo
            Left = 217
            Top = 227
            Width = 450
            Height = 70
            Anchors = [akLeft, akTop, akRight]
            DataSource = DataModule1.DataSource1
            ReadOnly = True
            TabOrder = 9
          end
        end
      end
      object PanelUpdate: TPanel
        Left = 437
        Top = 104
        Width = 324
        Height = 585
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        Visible = False
        object PanelUpdateControl: TPanel
          Left = 0
          Top = 368
          Width = 322
          Height = 136
          Align = alBottom
          Padding.Left = 5
          Padding.Top = 5
          Padding.Right = 5
          Padding.Bottom = 10
          TabOrder = 0
          ExplicitTop = 388
          ExplicitWidth = 330
          DesignSize = (
            322
            136)
          object LabelUpdateHelp1: TLabel
            Left = 295
            Top = 6
            Width = 10
            Height = 40
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
            ExplicitWidth = 18
          end
          object LabelUpdateHelp2: TLabel
            Left = 247
            Top = 98
            Width = 10
            Height = 27
            Cursor = crHelp
            Hint = #1042#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1093' '#1092#1086#1088#1084' '#1073#1077#1079' '#1087#1088#1086#1074#1077#1088#1082#1080
            Alignment = taCenter
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = '?'
            ParentShowHint = False
            ShowHint = True
            Layout = tlCenter
            ExplicitWidth = 18
          end
          object CheckBoxForceUpdate: TCheckBox
            Left = 6
            Top = 98
            Width = 227
            Height = 27
            Anchors = [akLeft, akTop, akRight]
            Caption = #1055#1088#1080#1085#1091#1076#1080#1090#1077#1083#1100#1085#1086#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
            TabOrder = 0
            OnClick = CheckBoxForceUpdateClick
            ExplicitWidth = 235
          end
          object ButtonCheckForms: TButton
            Left = 6
            Top = 6
            Width = 275
            Height = 40
            Anchors = [akLeft, akTop, akRight]
            Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1092#1086#1088#1084#1099' '#1085#1072' '#1072#1082#1090#1091#1072#1083#1100#1085#1086#1089#1090#1100
            TabOrder = 1
            WordWrap = True
            OnClick = ButtonCheckFormsClick
            ExplicitWidth = 283
          end
          object ButtonBeginUpdateForms: TButton
            Left = 6
            Top = 52
            Width = 275
            Height = 40
            Hint = 
              #1059' '#1074#1099#1073#1088#1072#1085#1085#1099#1093' '#1092#1086#1088#1084' '#1074#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1087#1086#1080#1089#1082' '#1085#1072' xml '#1092#1072#1081#1083#1099'. '#1055#1086#1089#1083#1077' '#1101#1090#1086#1075#1086' '#1089#1088#1072 +
              #1074#1085#1080#1074#1072#1077#1090#1089#1103' '#1074#1077#1088#1089#1080#1103' '#1092#1086#1088#1084#1099' '#1074' '#1092#1072#1081#1083#1077' '#1080' '#1074#1077#1088#1089#1080#1103', '#1082#1086#1090#1086#1088#1072#1103' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
            Anchors = [akLeft, akTop, akRight]
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1086#1090#1084#1077#1095#1077#1085#1099#1077' '#1092#1086#1088#1084#1099
            Enabled = False
            TabOrder = 2
            WordWrap = True
            OnClick = ButtonBeginUpdateFormsClick
            ExplicitWidth = 283
          end
        end
        object PanelUpdateHeader: TPanel
          Left = 0
          Top = 0
          Width = 322
          Height = 41
          Cursor = crArrow
          Hint = #1047#1072#1082#1088#1099#1090#1100
          Align = alTop
          BevelOuter = bvNone
          Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1092#1086#1088#1084
          Color = 2105376
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Montserrat SemiBold'
          Font.Style = [fsBold]
          Padding.Right = 10
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          StyleName = 'Windows'
          OnMouseDown = PanelUpdateHeaderMouseDown
          ExplicitWidth = 330
          object ImageUpdateClose: TImage
            Left = 288
            Top = 0
            Width = 24
            Height = 41
            Cursor = crHandPoint
            Hint = #1047#1072#1082#1088#1099#1090#1100
            Align = alRight
            Center = True
            ParentShowHint = False
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
              00180806000000E0773DF80000000473424954080808087C0864880000000970
              485973000000B1000000B101C62D498D0000001974455874536F667477617265
              007777772E696E6B73636170652E6F72679BEE3C1A000002674944415478DABD
              554B68135114BD775E16924CA23B51515C9956DBBA68338348A566AA56AC6057
              2EB4F543694145D1AD4BB7820A8A46046DB5EB2EFC972611444212BB4950A32B
              258AE2CEA4131532F3BCF9A96F9C7C26A55E18E677DF39EF9D73DFBB08CB1CD8
              4A525E533733CEFD26E286CA20FEC16046C637B790699BE0EBC080EC61FA590E
              78985E37D92671CCA064CEB8A59F97702EA5B74CA06BCA3007B8418FEB5A54E2
              239A38E989C61F3525D007D5E39CF39BF4C81CCA5DA4154DC891F8EDBA04F960
              60072246DA00AF85C939ECF24612917F08F8FE5EB75E60EF1CC8522FB21EB7D1
              81F7170A02415E0B9C46C02B42AA6F15985BBA418A3DB79FEEB67E905EA50072
              DF84EF5418A7BCE1F835816031A8A4E9ADCB0A503C771ED8C359607742028871
              74128C7D23E0BA7801A4F80B0B354FCBE164CF6F027D4FEF1A5E649FC0C674E3
              D031300E1C04E9C12CB8A6C97B1259F83615029BA024BE567E96FC52065CD402
              4384FDB89EA8B5D99600CB2B1B1E69045E7377489E4F3CAD100C2A63C439D5C8
              B9DAAC4BD114BCBC061CA392BD5B2108AAA3807CDA114155AE060CA3E4C3BDFF
              2491A6AE26C6CF4D4DAE023A36B9BA0A2A68ECFE3BABFD3285941C4E6C051036
              9A7A928EE1AB429A6F25989D5D76009509A8DB417A9DA6C1398BBFFC84773E79
              5D20A81E15A5F37D3D2C2DB29E02F3632CF65D2028454E53FA2580282CC761F7
              C70BE508DD6ED1E572085EA46B9CB417F6937DC309F6EDE528851CC895259127
              A8EE9F587FD46D997C778FA760AC38435BA9D4323BEBA4BD410E336ED78FCB8E
              5AA635723BFBFC8CB10ED277637910C27BC3A0A61F7DF9B6D9D896089612BF00
              071C1728C740F3D00000000049454E44AE426082}
            Proportional = True
            ShowHint = True
            OnClick = ImageUpdateCloseClick
            ExplicitLeft = 296
          end
        end
        object PanelUpdateForms: TPanel
          Left = 0
          Top = 41
          Width = 322
          Height = 327
          Align = alClient
          Padding.Left = 5
          Padding.Right = 5
          Padding.Bottom = 5
          TabOrder = 2
          ExplicitWidth = 330
          ExplicitHeight = 347
          object GroupBoxFormsUpdate: TGroupBox
            Left = 6
            Top = 54
            Width = 310
            Height = 267
            Align = alClient
            Caption = #1057#1087#1080#1089#1086#1082' '#1092#1086#1088#1084' '#1082' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1102
            TabOrder = 0
            ExplicitTop = 28
            ExplicitWidth = 318
            ExplicitHeight = 313
            object CheckListBoxFormsUpdate: TCheckListBox
              Left = 1
              Top = 19
              Width = 308
              Height = 247
              Align = alClient
              ItemHeight = 18
              TabOrder = 0
              ExplicitWidth = 316
              ExplicitHeight = 293
            end
          end
          object CheckBoxSelectAllForms: TCheckBox
            Left = 6
            Top = 1
            Width = 310
            Height = 27
            Align = alTop
            Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077' '#1092#1086#1088#1084#1099
            TabOrder = 1
            OnClick = CheckBoxSelectAllFormsClick
            ExplicitWidth = 318
          end
          object PanelFormFindUpdate: TPanel
            Left = 6
            Top = 28
            Width = 310
            Height = 26
            Align = alTop
            Padding.Left = 5
            Padding.Right = 15
            TabOrder = 2
            ExplicitWidth = 318
            object LabelRecordCountUpdate: TLabel
              Left = 221
              Top = 1
              Width = 73
              Height = 24
              Align = alClient
              Layout = tlCenter
              ExplicitWidth = 3
              ExplicitHeight = 18
            end
            object EditFormFindUpdate: TEdit
              Left = 6
              Top = 1
              Width = 195
              Height = 24
              Align = alLeft
              TabOrder = 0
              TextHint = #1055#1086#1080#1089#1082' '#1087#1086' '#1092#1086#1088#1084#1072#1084'...'
              OnChange = EditFormFindUpdateChange
            end
            object SpinButtonChangeRecordUpdate: TSpinButton
              Left = 201
              Top = 1
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
              Enabled = False
              TabOrder = 1
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
              OnDownClick = SpinButtonChangeRecordUpdateDownClick
              OnUpClick = SpinButtonChangeRecordUpdateUpClick
              ExplicitLeft = 272
              ExplicitTop = 8
              ExplicitHeight = 25
            end
          end
        end
        object MemoUpdateMsg: TMemo
          Left = 0
          Top = 504
          Width = 322
          Height = 79
          Align = alBottom
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Montserrat'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      ImageIndex = 1
    end
  end
  object MainMenu1: TMainMenu
    Left = 532
    Top = 676
    object N1: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object N2: TMenuItem
        Caption = #1056#1091#1082#1086#1074#1086#1076#1089#1090#1074#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      end
    end
  end
  object IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 912
    Top = 607
  end
  object PopupMenuLinks: TPopupMenu
    Left = 912
    Top = 543
    object NLinksCopyToClipboard: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1089#1089#1099#1083#1082#1091
      OnClick = NLinksCopyToClipboardClick
    end
  end
  object ImageList1: TImageList
    Height = 20
    ShareImages = True
    Width = 20
    Scaled = True
    Left = 440
    Top = 678
    Bitmap = {
      494C010101000800040014001400FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000500000001400000001002000000000000019
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000828282FF828282FF636363FF6363
      63FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000828282FF828282FF828282FF636363FF6363
      63FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008282
      82FF828282FF828282FF828282EE828282FF828282FF828282FF636363FF6363
      63FF636363FF00000000636363FF636363FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000828282FF8282
      82FF828282FF828282FF828282FF828282FF828282FF828282FF636363FF6363
      63FF636363FF636363FF636363FF636363FF636363FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000828282FF828282FF8282
      82FF828282FF828282FF828282FF828282FF434343FF434343FF242424FF2424
      24FF636363FF636363FF636363FF636363FF636363FF636363FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000828282FF8282
      82FF828282FF828282FF434343FF434343FF636363FF636363FF3F3F3FFF2424
      24FF242424FF242424FF636363FF636363FF636363FF636363E5000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000828282FF8282
      82FF828282FF434343FF464646FF636363FF636363FF636363FF3F3F3FFF3F3F
      3FFF3F3F3FFF242424FF2E2E2EFF636363FF636363FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000828282FF8282
      82FF454545FF434343FF636363FF636363FF0000000000000000000000003F3F
      3FFF3F3F3FFF3F3F3FFF242424FF636363FF636363FF636363FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000828282FF828282FF828282FF8282
      82FF434343FF636363FF636363FF000000000000000000000000000000000000
      00003F3F3FFF3F3F3FFF242424FF636363FF636363FF636363FF636363FF6363
      63FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000828282FF828282FF828282FF8282
      82FF434343FF636363FF636363FF000000000000000000000000000000000000
      0000000000003F3F3FFF282828FF242424FF636363FF636363FF636363FF6363
      63FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000828282FF828282FF828282FF8282
      82FF434343FF636363FF636363FF000000000000000000000000000000000000
      0000000000003F3F3FFF282828FF242424FF636363FF636363FF636363FF6363
      63FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000828282FF828282FF828282FF8282
      82FF434343FF636363FF636363FF000000000000000000000000000000000000
      00003F3F3FFF3F3F3FFF242424FF636363FF636363FF636363FF636363FF6363
      63FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008282827B828282FF8282
      82FF434343FF434343FF636363FF636363FF0000000000000000000000003F3F
      3FFF3F3F3FFF3F3F3FFF242424FF636363FF636363FF636363FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000828282FF8282
      82FF828282FF434343FF464646FF636363FF636363FF636363FF3F3F3FFF3F3F
      3FFF3F3F3FFF242424FF2E2E2EFF636363FF636363FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000828282FF8282
      82FF828282FF828282FF434343FF434343FF636363FF636363FF3F3F3FFF2424
      24FF242424FF242424FF636363FF636363FF636363FF636363E5000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000828282FF828282FF8282
      82FF828282FF828282FF828282FF828282FF434343FF434343FF242424FF2424
      24FF636363FF636363FF636363FF636363FF636363FF636363FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000828282FF8282
      82FF828282FF828282FF828282FF828282FF828282FF828282FF636363FF6363
      63FF636363FF636363FF636363FF636363FF636363FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008282
      82FF828282FF828282FF828282FF828282FF828282FF828282FF636363FF6363
      63FF636363FF00000000636363FF636363FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000828282FF828282FF828282FF636363FF6363
      63FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000828282FF828282FF636363FF6363
      63FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000050000000140000000100010000000000F00000000000000000000000
      000000000000000000000000FFFFFF00FF0FF0000000000000000000FE0FF000
      0000000000000000E004F0000000000000000000C00070000000000000000000
      800030000000000000000000C00030000000000000000000C000700000000000
      00000000C0E03000000000000000000001F00000000000000000000001F80000
      000000000000000001F80000000000000000000001F000000000000000000000
      80E030000000000000000000C00070000000000000000000C000300000000000
      00000000800030000000000000000000C00070000000000000000000E004F000
      0000000000000000FE0FF0000000000000000000FF0FF0000000000000000000
      00000000000000000000000000000000000000000000}
  end
  object PopupMenuSort: TPopupMenu
    Left = 1014
    Top = 550
    object NUnsort: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1091
      Enabled = False
      OnClick = NUnsortClick
    end
  end
end

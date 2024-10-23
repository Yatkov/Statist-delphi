object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = #1057#1090#1072#1090#1080#1089#1090
  ClientHeight = 710
  ClientWidth = 1083
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Montserrat Medium'
  Font.Style = [fsBold]
  Menu = MainMenu1
  Position = poScreenCenter
  WindowState = wsMaximized
  StyleName = 'Windows10 Dark'
  OnCreate = FormCreate
  TextHeight = 18
  object PageControlMain: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1077
    Height = 704
    ActivePage = TabSheetForms
    Align = alClient
    MultiLine = True
    ScrollOpposite = True
    TabHeight = 30
    TabOrder = 0
    TabWidth = 170
    StyleName = 'Glossy'
    ExplicitWidth = 1100
    ExplicitHeight = 826
    object TabSheetForms: TTabSheet
      Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1087#1086' '#1092#1086#1088#1084#1072#1084
      object Splitter1: TSplitter
        Left = 379
        Top = 0
        Width = 10
        Height = 664
        Beveled = True
        ResizeStyle = rsLine
        ExplicitLeft = 393
        ExplicitHeight = 710
      end
      object PanelForms: TPanel
        Left = 0
        Top = 0
        Width = 379
        Height = 664
        Align = alLeft
        TabOrder = 0
        ExplicitHeight = 786
        object EditFormsFind: TEdit
          Left = 1
          Top = 42
          Width = 377
          Height = 26
          Align = alTop
          TabOrder = 0
          TextHint = #1055#1086#1080#1089#1082' '#1087#1086' '#1092#1086#1088#1084#1072#1084'...'
          OnChange = EditFormsFindChange
        end
        object PanelFormControl: TPanel
          Left = 1
          Top = 620
          Width = 377
          Height = 43
          Align = alBottom
          Padding.Left = 5
          Padding.Top = 5
          Padding.Right = 5
          Padding.Bottom = 5
          TabOrder = 1
          ExplicitTop = 742
          object LabelFormCounter: TLabel
            Left = 6
            Top = 6
            Width = 365
            Height = 18
            Align = alTop
            ExplicitWidth = 3
          end
        end
        object DBGridForms: TDBGrid
          Left = 1
          Top = 68
          Width = 377
          Height = 552
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
          Width = 377
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
      object PanelMainFormInfo: TPanel
        Left = 389
        Top = 0
        Width = 680
        Height = 664
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 13
        ExplicitTop = 104
        ExplicitWidth = 666
        ExplicitHeight = 553
        object PanelFormCalendar: TPanel
          Left = 1
          Top = 395
          Width = 678
          Height = 268
          Align = alClient
          TabOrder = 0
          ExplicitTop = 99
          ExplicitWidth = 664
          ExplicitHeight = 453
          object PanelCalendar: TPanel
            Left = 1
            Top = 1
            Width = 264
            Height = 266
            Align = alLeft
            Padding.Left = 5
            Padding.Top = 5
            Padding.Right = 5
            TabOrder = 0
            ExplicitHeight = 451
            object LabelCalendarCount: TLabel
              Left = 6
              Top = 340
              Width = 252
              Height = 18
              Align = alTop
              ExplicitTop = 366
              ExplicitWidth = 3
            end
            object CalendarForms: TCalendarView
              Left = 6
              Top = 6
              Width = 252
              Height = 294
              Align = alTop
              BorderStyle = bsNone
              FirstDayOfWeek = dwMonday
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Segoe UI'
              Font.Style = []
              HeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
              HeaderInfo.DaysOfWeekFont.Color = clWindowText
              HeaderInfo.DaysOfWeekFont.Height = -13
              HeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
              HeaderInfo.DaysOfWeekFont.Style = []
              HeaderInfo.Font.Charset = DEFAULT_CHARSET
              HeaderInfo.Font.Color = clWindowText
              HeaderInfo.Font.Height = -20
              HeaderInfo.Font.Name = 'Segoe UI'
              HeaderInfo.Font.Style = []
              OnChange = CalendarFormsChange
              ParentFont = False
              SelectionMode = smMultiple
              TabOrder = 0
              ExplicitTop = 32
            end
            object ButtonResetCaldendar: TButton
              Left = 6
              Top = 300
              Width = 252
              Height = 40
              Align = alTop
              Caption = #1057#1073#1088#1086#1089#1080#1090#1100
              TabOrder = 1
              OnClick = ButtonResetCaldendarClick
              ExplicitTop = 326
            end
          end
          object ListBoxFormCalendar: TListBox
            Left = 489
            Top = 1
            Width = 188
            Height = 252
            Align = alClient
            BorderStyle = bsNone
            Color = 2105376
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Montserrat Medium'
            Font.Style = [fsBold]
            IntegralHeight = True
            ItemHeight = 18
            ParentFont = False
            TabOrder = 1
            StyleName = 'Windows'
            OnDblClick = ListBoxFormCalendarDblClick
            ExplicitWidth = 211
            ExplicitHeight = 306
          end
          object GroupBoxCalendarSettings: TGroupBox
            Left = 265
            Top = 1
            Width = 224
            Height = 266
            Align = alLeft
            Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1082#1072#1083#1077#1085#1076#1072#1088#1103
            TabOrder = 2
            ExplicitHeight = 331
            object CheckBoxCalendarMultiselect: TCheckBox
              Left = 6
              Top = 40
              Width = 155
              Height = 17
              Caption = #1052#1091#1083#1100#1090#1080#1074#1099#1076#1077#1083#1077#1085#1080#1077
              TabOrder = 0
            end
          end
        end
        object PanelMain: TPanel
          Left = 1
          Top = 1
          Width = 678
          Height = 394
          Align = alTop
          TabOrder = 1
          ExplicitWidth = 916
          object GroupBoxUsefulFiles: TGroupBox
            Left = 445
            Top = 1
            Width = 232
            Height = 392
            Align = alRight
            Caption = #1055#1086#1083#1077#1079#1085#1099#1077' '#1092#1072#1081#1083#1099
            TabOrder = 0
            ExplicitLeft = 470
            ExplicitHeight = 331
            object TreeViewUsefulFiles: TTreeView
              Left = 2
              Top = 81
              Width = 228
              Height = 280
              Align = alClient
              Images = ImageListUsefulFiles
              Indent = 19
              ReadOnly = True
              StateImages = ImageListUsefulFiles
              TabOrder = 0
              OnDblClick = TreeViewUsefulFilesDblClick
              ExplicitTop = 49
            end
            object ButtonUpdateDir: TButton
              Left = 2
              Top = 361
              Width = 228
              Height = 29
              Align = alBottom
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              TabOrder = 1
              OnClick = ButtonUpdateDirClick
              ExplicitTop = 20
            end
            object PanelUsefulFilesExpand: TPanel
              Left = 2
              Top = 20
              Width = 228
              Height = 35
              Align = alTop
              TabOrder = 2
              object ButtonUsefulFilesExpand: TButton
                Left = 1
                Top = 1
                Width = 112
                Height = 33
                Align = alLeft
                Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100
                TabOrder = 0
                OnClick = ButtonUsefulFilesExpandClick
                ExplicitHeight = 39
              end
              object ButtonCollapse: TButton
                Left = 113
                Top = 1
                Width = 114
                Height = 33
                Align = alClient
                Caption = #1057#1074#1077#1088#1085#1091#1090#1100
                TabOrder = 1
                OnClick = ButtonCollapseClick
                ExplicitLeft = 9
                ExplicitTop = 2
                ExplicitWidth = 112
                ExplicitHeight = 39
              end
            end
            object EditUsefulFilesFind: TEdit
              Left = 2
              Top = 55
              Width = 228
              Height = 26
              Align = alTop
              TabOrder = 3
              TextHint = #1055#1086#1080#1089#1082' '#1087#1086' '#1092#1072#1081#1083#1072#1084
              ExplicitLeft = 112
              ExplicitTop = 240
              ExplicitWidth = 121
            end
          end
          object PanelContent: TPanel
            Left = 1
            Top = 1
            Width = 444
            Height = 392
            Align = alClient
            TabOrder = 1
            ExplicitLeft = -516
            ExplicitWidth = 701
            ExplicitHeight = 39
            object PanelFormDownload: TPanel
              Left = 1
              Top = 1
              Width = 442
              Height = 152
              Align = alTop
              TabOrder = 0
              ExplicitWidth = 699
              object GroupBoxFormGovernmLinks: TGroupBox
                Left = 203
                Top = 1
                Width = 352
                Height = 150
                Align = alLeft
                Caption = #1047#1072#1082#1086#1085#1086#1076#1072#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
                TabOrder = 0
                ExplicitLeft = 209
                DesignSize = (
                  352
                  150)
                object LinkLabelFormFill: TLinkLabel
                  Left = 13
                  Top = 35
                  Width = 188
                  Height = 22
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
                  TabOrder = 0
                  UseVisualStyle = True
                end
                object LinkLabelFormYtv: TLinkLabel
                  Left = 13
                  Top = 80
                  Width = 188
                  Height = 22
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
                  TabOrder = 1
                  UseVisualStyle = True
                end
                object DBEditFormFill: TDBEdit
                  Left = 207
                  Top = 34
                  Width = 134
                  Height = 26
                  Anchors = [akLeft, akTop, akRight]
                  DataSource = DataModule1.DataSource1
                  ReadOnly = True
                  TabOrder = 2
                end
                object DBEditFormYtv: TDBEdit
                  Left = 206
                  Top = 77
                  Width = 135
                  Height = 26
                  Anchors = [akLeft, akTop, akRight]
                  DataSource = DataModule1.DataSource1
                  ReadOnly = True
                  TabOrder = 3
                end
              end
              object GroupBoxFormMainLink: TGroupBox
                Left = 1
                Top = 1
                Width = 202
                Height = 150
                Align = alLeft
                Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1092#1072#1081#1083#1099
                TabOrder = 1
                object ShapeFormDoc: TShape
                  Left = 16
                  Top = 70
                  Width = 70
                  Height = 26
                  Cursor = crHandPoint
                  Brush.Style = bsClear
                  ParentShowHint = False
                  Pen.Color = clWhite
                  Shape = stRoundRect
                  ShowHint = False
                end
                object ShapeFormPdf: TShape
                  Left = 16
                  Top = 110
                  Width = 70
                  Height = 26
                  Cursor = crHandPoint
                  Brush.Style = bsClear
                  ParentShowHint = False
                  Pen.Color = clWhite
                  Shape = stRoundRect
                  ShowHint = False
                end
                object ShapeFormXml: TShape
                  Left = 16
                  Top = 30
                  Width = 70
                  Height = 26
                  Cursor = crHandPoint
                  Brush.Style = bsClear
                  ParentShowHint = False
                  Pen.Color = clWhite
                  Shape = stRoundRect
                  ShowHint = False
                end
                object LabelFormXML: TLabel
                  Left = 16
                  Top = 30
                  Width = 70
                  Height = 26
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'XML'
                  ParentShowHint = False
                  PopupMenu = PopupMenuLinks
                  ShowHint = True
                  Transparent = True
                  Layout = tlCenter
                end
                object LabelFormPdf: TLabel
                  Left = 16
                  Top = 110
                  Width = 70
                  Height = 26
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'PDF'
                  ParentShowHint = False
                  PopupMenu = PopupMenuLinks
                  ShowHint = True
                  Layout = tlCenter
                end
                object LabelFormDoc: TLabel
                  Left = 16
                  Top = 70
                  Width = 70
                  Height = 26
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'DOC'
                  ParentShowHint = False
                  PopupMenu = PopupMenuLinks
                  ShowHint = True
                  Layout = tlCenter
                  OnClick = LabelFormDocClick
                end
                object DBEditFormXmlDate: TDBEdit
                  Left = 100
                  Top = 31
                  Width = 90
                  Height = 26
                  Hint = #1042#1077#1088#1089#1080#1103' xml'
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  Color = 1973790
                  DataSource = DataModule1.DataSource1
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWhite
                  Font.Height = -13
                  Font.Name = 'Montserrat Medium'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ParentShowHint = False
                  ReadOnly = True
                  ShowHint = True
                  TabOrder = 0
                  StyleName = 'Windows'
                end
              end
            end
            object PanelFormInfo: TPanel
              Left = 1
              Top = 153
              Width = 442
              Height = 238
              Align = alClient
              Padding.Left = 5
              Padding.Top = 5
              Padding.Right = 5
              Padding.Bottom = 5
              TabOrder = 1
              ExplicitWidth = 699
              ExplicitHeight = 177
              DesignSize = (
                442
                238)
              object LabelFormFullName: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 51
                Width = 190
                Height = 25
                Alignment = taRightJustify
                AutoSize = False
                Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1092#1086#1088#1084#1099
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Montserrat SemiBold'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LabelFormOKUD: TLabel
                AlignWithMargins = True
                Left = 17
                Top = 127
                Width = 40
                Height = 18
                Caption = #1054#1050#1059#1044
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Montserrat SemiBold'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LabelFormPeriod: TLabel
                AlignWithMargins = True
                Left = 372
                Top = 131
                Width = 111
                Height = 18
                Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Montserrat SemiBold'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LabelFormSrok: TLabel
                AlignWithMargins = True
                Left = 17
                Top = 165
                Width = 133
                Height = 18
                Caption = #1057#1088#1086#1082' '#1089#1076#1072#1095#1080' '#1092#1086#1088#1084#1099
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Montserrat SemiBold'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBMemoFormFullName: TDBMemo
                Left = 217
                Top = 51
                Width = 210
                Height = 62
                Anchors = [akLeft, akTop, akRight]
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                Color = 2500134
                DataSource = DataModule1.DataSource1
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Montserrat Medium'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                StyleName = 'Windows'
                ExplicitWidth = 467
              end
              object DBEditFormPeriod: TDBEdit
                Left = 497
                Top = 127
                Width = 0
                Height = 26
                Anchors = [akLeft, akTop, akRight]
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                Color = 2500134
                DataSource = DataModule1.DataSource1
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Montserrat Medium'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
                StyleName = 'Windows'
                ExplicitWidth = 168
              end
              object DBEditFormOKUD: TDBEdit
                Left = 217
                Top = 127
                Width = 136
                Height = 26
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                Color = 2500134
                DataSource = DataModule1.DataSource1
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Montserrat Medium'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                StyleName = 'Windows'
              end
              object DBMemoFormSrok: TDBMemo
                Left = 217
                Top = 167
                Width = 210
                Height = 53
                Anchors = [akLeft, akTop, akRight]
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                Color = 2500134
                DataSource = DataModule1.DataSource1
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Montserrat Medium'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
                StyleName = 'Windows'
                ExplicitWidth = 448
              end
              object DBEditFormXmlLink: TDBEdit
                Left = 396
                Top = 0
                Width = 53
                Height = 26
                DataSource = DataModule1.DataSource1
                ReadOnly = True
                TabOrder = 4
                Visible = False
                OnChange = DBEditFormXmlLinkChange
              end
              object DBEditFormDocLink: TDBEdit
                Left = 392
                Top = 6
                Width = 49
                Height = 26
                DataSource = DataModule1.DataSource1
                ReadOnly = True
                TabOrder = 5
                Visible = False
                OnChange = DBEditFormDocLinkChange
              end
              object DBEditFormPdfLink: TDBEdit
                Left = 400
                Top = 19
                Width = 49
                Height = 26
                DataSource = DataModule1.DataSource1
                ReadOnly = True
                TabOrder = 6
                Visible = False
                OnChange = DBEditFormPdfLinkChange
              end
              object PanelFormName: TPanel
                Left = 6
                Top = 6
                Width = 430
                Height = 39
                Align = alTop
                Padding.Left = 5
                Padding.Top = 5
                Padding.Right = 5
                Padding.Bottom = 5
                TabOrder = 7
                ExplicitWidth = 687
                object DBTextFormName: TDBText
                  Left = 6
                  Top = 6
                  Width = 155
                  Height = 27
                  Align = alLeft
                  AutoSize = True
                  DataSource = DataModule1.DataSource1
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Montserrat'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ExplicitHeight = 22
                end
                object Bevel1: TBevel
                  Left = 161
                  Top = 6
                  Width = 26
                  Height = 27
                  Align = alLeft
                  Shape = bsSpacer
                  Style = bsRaised
                end
                object ButtonFormPreview: TButton
                  Left = 187
                  Top = 6
                  Width = 169
                  Height = 27
                  Align = alLeft
                  Caption = #1055#1088#1077#1076#1087#1088#1086#1089#1084#1086#1090#1088' '#1092#1086#1088#1084#1099
                  TabOrder = 0
                  OnClick = ButtonFormPreviewClick
                end
              end
            end
          end
        end
      end
    end
    object TabSheetOrganization: TTabSheet
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      ImageIndex = 1
      object PanelOrgFind: TPanel
        Left = 0
        Top = 0
        Width = 1069
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        Padding.Left = 10
        Padding.Top = 3
        Padding.Bottom = 3
        TabOrder = 0
        ExplicitWidth = 1092
        object LabelFindOrgMsg: TLabel
          Left = 176
          Top = 3
          Width = 3
          Height = 27
          Align = alLeft
          Layout = tlCenter
          ExplicitHeight = 18
        end
        object SearchBoxOrgInn: TSearchBox
          Left = 10
          Top = 3
          Width = 166
          Height = 27
          Align = alLeft
          TabOrder = 0
          TextHint = #1048#1053#1053
          OnInvokeSearch = SearchBoxOrgInnInvokeSearch
          ExplicitHeight = 26
        end
      end
      object PanelCheckOrg: TPanel
        Left = 0
        Top = 33
        Width = 1069
        Height = 631
        Align = alClient
        DockSite = True
        Padding.Left = 3
        Padding.Top = 3
        Padding.Right = 3
        Padding.Bottom = 3
        TabOrder = 1
        StyleName = 'Glossy'
        ExplicitWidth = 1092
        ExplicitHeight = 753
      end
    end
    object TabSheetDirectory: TTabSheet
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      ImageIndex = 2
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
    Left = 216
    Top = 543
  end
  object PopupMenuLinks: TPopupMenu
    Left = 912
    Top = 543
    object NLinksCopyToClipboard: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1089#1089#1099#1083#1082#1091
      OnClick = NLinksCopyToClipboardClick
    end
    object NViewInFolder: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1087#1082#1077
      OnClick = NViewInFolderClick
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
    Left = 1022
    Top = 542
    object NUnsort: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1091
      Enabled = False
      OnClick = NUnsortClick
    end
  end
  object ActionList1: TActionList
    Left = 118
    Top = 542
    object TabNextTab1: TNextTab
      Category = 'Tab'
      Caption = '>>'
    end
    object TabPreviousTab1: TPreviousTab
      Category = 'Tab'
      Caption = '&Previous'
    end
  end
  object PopupMenuClearMsg: TPopupMenu
    Left = 974
    Top = 622
    object NClearMsg: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1083#1086#1075#1080
      OnClick = NClearMsgClick
    end
  end
  object ImageListUsefulFiles: TImageList
    Left = 102
    Top = 624
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000000000FF000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FFFFFFFFFF000000FF0A0A0AFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF9F9F9FF0A0A0AFF0A0A0AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FFFFFFFFFF000000FFE3E3E3FF0A0A0AFF242424FF0A0A
      0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFFA9A9A9FF0A0A0AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      00FF000000FFDDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFFD2D2
      D2FF000000FF000000FFFFFFFFFF000000FFFFFFFFFF0A0A0AFF0A0A0AFFEAEA
      EAFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFFFFFFFFFF0A0A0AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      00FF000000FF222222FF222222FF222222FF222222FF222222FF222222FF1414
      14FF000000FF000000FFFFFFFFFF000000FFFFFFFFFF0A0A0AFF0A0A0AFFFFFF
      FFFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFFD4D4D4FF0A0A0AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FFFFFFFFFF000000FFFFFFFFFF0A0A0AFF0A0A0AFF9292
      92FF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFF0A0A0AFF303030FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FFFFFFFFFF000000FFFFFFFFFF0A0A0AFF0A0A0AFF0A0A
      0AFF757575FF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFF0A0A0AFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000FF000000FFFFFFFFFF000000FFFFFFFFFF0A0A0AFF0A0A0AFF0A0A
      0AFFFFFFFFFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFF0A0A0AFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FFFFFFFFFF000000FFFFFFFFFF0A0A0AFF0A0A0AFF0A0A
      0AFFF9F9F9FF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFF0A0A0AFF323232FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FFFFFFFFFF000000FFFFFFFFFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      00FF000000FF000000FF000000FF000000FF000000FF2B2B2BFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      00FF000000FF000000FF000000FF000000FF000000FF7E7E7EFF818181FF0000
      00FF000000FFFFFFFFFF111111FF000000FFFFFFFFFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFFC7C7C7FF0A0A0AFF0A0A0AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      00FF000000FF000000FF000000FF000000FF000000FF7E7E7EFF818181FF0000
      00FFFFFFFFFF111111FF000000FF000000FFFFFFFFFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFF2D2D2DFF848484FF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      00FF000000FF000000FF000000FF000000FF000000FF7E7E7EFF818181FFFFFF
      FFFF111111FF000000FF000000FF000000FF0B0B0BFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFE2E2E2FF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0505
      05FF000000FF000000FF000000FF000000FF000000FF7E7E7EFFFFFFFFFF0E0E
      0EFF000000FF000000FF000000FF000000FF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FFFDFD
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E0E0EFF0000
      00FF000000FF000000FF000000FF000000FF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A
      0AFF0A0A0AFF0A0A0AFF0A0A0AFF0A0A0AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
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
    Left = 754
    Top = 32
  end
end

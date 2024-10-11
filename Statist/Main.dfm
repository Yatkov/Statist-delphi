object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = #1057#1090#1072#1090#1080#1089#1090
  ClientHeight = 663
  ClientWidth = 972
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Montserrat Medium'
  Font.Style = [fsBold]
  Menu = MainMenu1
  WindowState = wsMaximized
  StyleName = 'Windows10 Dark'
  OnCreate = FormCreate
  TextHeight = 18
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 966
    Height = 657
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    ScrollOpposite = True
    TabHeight = 30
    TabOrder = 0
    TabWidth = 170
    StyleName = 'Glossy'
    ExplicitWidth = 964
    ExplicitHeight = 649
    object TabSheet1: TTabSheet
      Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1087#1086' '#1092#1086#1088#1084#1072#1084
      object PanelForms: TPanel
        Left = 0
        Top = 0
        Width = 393
        Height = 617
        Align = alLeft
        TabOrder = 0
        ExplicitHeight = 609
        object EditFormsFind: TEdit
          Left = 1
          Top = 1
          Width = 391
          Height = 26
          Align = alTop
          TabOrder = 0
          TextHint = #1055#1086#1080#1089#1082' '#1087#1086' '#1092#1086#1088#1084#1072#1084'...'
        end
        object ListBoxForms: TListBox
          Left = 1
          Top = 27
          Width = 391
          Height = 493
          Align = alClient
          Ctl3D = False
          DoubleBuffered = True
          ItemHeight = 18
          ParentCtl3D = False
          ParentDoubleBuffered = False
          Sorted = True
          TabOrder = 1
          ExplicitHeight = 474
        end
        object PanelFormControl: TPanel
          Left = 1
          Top = 520
          Width = 391
          Height = 96
          Align = alBottom
          Padding.Left = 5
          Padding.Top = 5
          Padding.Right = 5
          Padding.Bottom = 5
          TabOrder = 2
          object CheckBoxFormsFullName: TCheckBox
            Left = 6
            Top = 6
            Width = 379
            Height = 17
            Align = alTop
            Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1092#1086#1088#1084
            TabOrder = 0
            ExplicitLeft = 1
            ExplicitTop = 599
            ExplicitWidth = 391
          end
          object ButtonUpdateForms: TButton
            Left = 6
            Top = 23
            Width = 379
            Height = 42
            Align = alTop
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1092#1086#1088#1084#1099
            TabOrder = 1
            OnClick = ButtonUpdateFormsClick
          end
        end
      end
      object ScrollBoxForms: TScrollBox
        Left = 393
        Top = 0
        Width = 565
        Height = 617
        VertScrollBar.Smooth = True
        Align = alClient
        TabOrder = 1
        StyleName = 'Glossy'
        ExplicitWidth = 563
        ExplicitHeight = 609
        object PanelFormDownload: TPanel
          Left = 0
          Top = 0
          Width = 561
          Height = 63
          Align = alTop
          TabOrder = 0
          ExplicitWidth = 559
          DesignSize = (
            561
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
          Width = 561
          Height = 550
          Align = alClient
          Padding.Left = 5
          Padding.Top = 5
          Padding.Right = 5
          Padding.Bottom = 5
          TabOrder = 1
          ExplicitWidth = 559
          ExplicitHeight = 542
          DesignSize = (
            561
            550)
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
            Width = 549
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
            Width = 329
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = 1973790
            ReadOnly = True
            TabOrder = 0
            StyleName = 'Glossy'
            ExplicitWidth = 327
          end
          object EditFormFullName: TEdit
            AlignWithMargins = True
            Left = 217
            Top = 329
            Width = 329
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = 1973790
            ReadOnly = True
            TabOrder = 1
            StyleName = 'Glossy'
            ExplicitWidth = 327
          end
          object EditFormOKUD: TEdit
            AlignWithMargins = True
            Left = 217
            Top = 184
            Width = 329
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = 1973790
            ReadOnly = True
            TabOrder = 2
            StyleName = 'Glossy'
            ExplicitWidth = 327
          end
          object EditFormPeriod: TEdit
            AlignWithMargins = True
            Left = 217
            Top = 141
            Width = 329
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = 1973790
            ReadOnly = True
            TabOrder = 3
            StyleName = 'Glossy'
            ExplicitWidth = 327
          end
          object EditFormYtv: TEdit
            AlignWithMargins = True
            Left = 217
            Top = 411
            Width = 329
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = 1973790
            ReadOnly = True
            TabOrder = 4
            StyleName = 'Glossy'
            ExplicitWidth = 327
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
            TabOrder = 5
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
            TabOrder = 6
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
            TabOrder = 7
            UseVisualStyle = True
          end
          object MemoFormFullName: TMemo
            Left = 217
            Top = 51
            Width = 329
            Height = 70
            Anchors = [akLeft, akTop, akRight]
            BevelInner = bvLowered
            BevelOuter = bvNone
            BorderStyle = bsNone
            ReadOnly = True
            TabOrder = 8
            ExplicitWidth = 327
          end
          object MemoFormSrok: TMemo
            Left = 217
            Top = 227
            Width = 329
            Height = 70
            Anchors = [akLeft, akTop, akRight]
            BevelInner = bvLowered
            BevelOuter = bvNone
            BorderStyle = bsNone
            ReadOnly = True
            TabOrder = 9
            ExplicitWidth = 327
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      ImageIndex = 1
    end
  end
  object MainMenu1: TMainMenu
    Left = 124
    Top = 156
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
    Left = 720
    Top = 559
  end
  object PopupMenuLinks: TPopupMenu
    Left = 872
    Top = 519
    object NLinksCopyToClipboard: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1089#1089#1099#1083#1082#1091
      OnClick = NLinksCopyToClipboardClick
    end
  end
end

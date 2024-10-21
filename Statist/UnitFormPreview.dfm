object FormPreview: TFormPreview
  Left = 0
  Top = 0
  Caption = #1055#1088#1077#1076#1087#1088#1086#1089#1084#1086#1090#1088' '#1092#1086#1088#1084#1099
  ClientHeight = 729
  ClientWidth = 1093
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Montserrat Medium'
  Font.Style = [fsBold]
  Position = poScreenCenter
  WindowState = wsMaximized
  StyleName = 'Windows10 Dark'
  TextHeight = 16
  object PageControlPreview: TPageControl
    Left = 0
    Top = 0
    Width = 1093
    Height = 729
    ActivePage = TabSheetForm
    Align = alClient
    TabOrder = 0
    StyleName = 'Glossy'
    ExplicitLeft = 217
    ExplicitWidth = 876
    object TabSheetForm: TTabSheet
      Caption = #1060#1086#1088#1084#1072
      PopupMenu = PopupMenu
      object PageControlForm: TPageControl
        Left = 0
        Top = 0
        Width = 1085
        Height = 698
        ActivePage = TabSheetPreview
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 144
        ExplicitTop = 224
        ExplicitWidth = 577
        ExplicitHeight = 249
        object TabSheetPreview: TTabSheet
          Caption = #1055#1088#1077#1076#1087#1088#1086#1089#1084#1086#1090#1088
          object ListBoxSections: TListBox
            Left = 0
            Top = 0
            Width = 217
            Height = 667
            Align = alLeft
            TabOrder = 0
            StyleName = 'Glossy'
            OnClick = ListBoxSectionsClick
            ExplicitHeight = 729
          end
          object ScrollBoxPreview: TScrollBox
            Left = 217
            Top = 0
            Width = 860
            Height = 667
            Align = alClient
            TabOrder = 1
            OnMouseWheelDown = ScrollBoxPreviewMouseWheelDown
            OnMouseWheelUp = ScrollBoxPreviewMouseWheelUp
            ExplicitLeft = 0
            ExplicitWidth = 1085
            ExplicitHeight = 698
          end
        end
        object TabSheetVerification: TTabSheet
          Caption = #1042#1085#1091#1090#1088#1080#1092#1086#1088#1084#1077#1085#1085#1099#1081' '#1082#1086#1085#1090#1088#1086#1083#1100
          ImageIndex = 1
        end
        object TabSheetStuff: TTabSheet
          Caption = #1052#1072#1090#1077#1088#1080#1072#1083
          ImageIndex = 2
        end
      end
    end
  end
  object PopupMenu: TPopupMenu
    Left = 36
    Top = 58
    object NClosePage: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ShortCut = 27
      OnClick = NClosePageClick
    end
  end
end

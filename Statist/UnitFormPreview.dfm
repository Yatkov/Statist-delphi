object FormPreview: TFormPreview
  Left = 0
  Top = 0
  Caption = #1055#1088#1077#1076#1087#1088#1086#1089#1084#1086#1090#1088' '#1092#1086#1088#1084#1099
  ClientHeight = 729
  ClientWidth = 1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  StyleName = 'Windows10 Dark'
  TextHeight = 15
  object PageControlPreview: TPageControl
    Left = 217
    Top = 0
    Width = 876
    Height = 729
    ActivePage = TabSheetPreview
    Align = alClient
    TabOrder = 0
    StyleName = 'Glossy'
    object TabSheetPreview: TTabSheet
      Caption = #1060#1086#1088#1084#1072
      PopupMenu = PopupMenu
      object ScrollBoxPreview: TScrollBox
        Left = 0
        Top = 0
        Width = 868
        Height = 699
        Align = alClient
        TabOrder = 0
        OnMouseWheelDown = ScrollBoxPreviewMouseWheelDown
        OnMouseWheelUp = ScrollBoxPreviewMouseWheelUp
        ExplicitLeft = 2
      end
    end
  end
  object ListBoxSections: TListBox
    Left = 0
    Top = 0
    Width = 217
    Height = 729
    Align = alLeft
    ItemHeight = 15
    TabOrder = 1
    StyleName = 'Glossy'
    OnClick = ListBoxSectionsClick
    ExplicitLeft = -2
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

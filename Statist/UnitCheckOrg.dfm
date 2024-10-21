object FormCheckOrg: TFormCheckOrg
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102
  ClientHeight = 751
  ClientWidth = 1020
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  StyleName = 'Windows10 Dark'
  OnEndDock = FormEndDock
  TextHeight = 15
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 1020
    Height = 751
    Align = alClient
    TabOrder = 0
    StyleName = 'Glossy'
    ExplicitWidth = 624
    ExplicitHeight = 441
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

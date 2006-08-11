object FDGAboutForm: TFDGAboutForm
  Left = 745
  Top = 429
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 181
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 9
    Top = 8
    Width = 353
    Height = 121
  end
  object Bevel2: TBevel
    Left = 17
    Top = 16
    Width = 337
    Height = 105
  end
  object OKButton: TBitBtn
    Left = 149
    Top = 144
    Width = 75
    Height = 25
    TabOrder = 0
    Kind = bkOK
  end
  object StaticText1: TStaticText
    Left = 70
    Top = 24
    Width = 232
    Height = 23
    Caption = 'FastGEO Demonstration Suite'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object StaticText2: TStaticText
    Left = 92
    Top = 56
    Width = 189
    Height = 20
    Caption = 'By Arash Partow (1997 - 2006)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object StaticText3: TStaticText
    Left = 114
    Top = 88
    Width = 144
    Height = 20
    Alignment = taCenter
    Caption = 'http://fastgeo.partow.net'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
end

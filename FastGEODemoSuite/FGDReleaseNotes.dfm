object FGDReleaseNotesForm: TFGDReleaseNotesForm
  Left = 278
  Top = 125
  BorderStyle = bsDialog
  Caption = 'FastGEO Demo Suite Release Notes'
  ClientHeight = 370
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 16
    Top = 8
    Width = 404
    Height = 281
  end
  object Memo: TMemo
    Left = 23
    Top = 15
    Width = 390
    Height = 266
    Enabled = False
    ReadOnly = True
    TabOrder = 0
  end
  object BitBtn: TBitBtn
    Left = 175
    Top = 312
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
end

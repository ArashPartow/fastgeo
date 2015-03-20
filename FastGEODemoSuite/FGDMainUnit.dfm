object MainFastGeoForm: TMainFastGeoForm
  Left = 347
  Top = 113
  Width = 1177
  Height = 1000
  Caption = 'FastGEO Demonstration Suite (version 0.0.1)'
  ClientHeight = 982
  ClientWidth = 1169
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 249
    Top = 0
    Width = 8
    Height = 927
    Cursor = crHSplit
    Beveled = True
  end
  object PaintPanel: TPanel
    Left = 257
    Top = 0
    Width = 912
    Height = 927
    Align = alClient
    TabOrder = 0
    object PaintBox: TPaintBox
      Left = 1
      Top = 1
      Width = 910
      Height = 925
      Align = alClient
      OnPaint = PaintBoxPaint
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 927
    Width = 1169
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object ControlPanel: TPanel
    Left = 0
    Top = 0
    Width = 249
    Height = 927
    Align = alLeft
    TabOrder = 2
    object OptionsPanel: TPanel
      Left = 1
      Top = 885
      Width = 247
      Height = 41
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 0
      object RefreshButton: TButton
        Left = 86
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Refresh'
        TabOrder = 0
        OnClick = RefreshButtonClick
      end
    end
    object MainPageControl: TPageControl
      Left = 1
      Top = 1
      Width = 247
      Height = 884
      ActivePage = BasicFunctionsTabSheet
      Align = alClient
      TabIndex = 1
      TabOrder = 1
      object DemoInfoTabSheet: TTabSheet
        Caption = 'Information'
        object InfoMemo: TMemo
          Left = 0
          Top = 0
          Width = 239
          Height = 856
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
      object BasicFunctionsTabSheet: TTabSheet
        Caption = 'Basic Functions'
        ImageIndex = 1
        object BFGroup: TRadioGroup
          Left = 0
          Top = 0
          Width = 239
          Height = 856
          Align = alClient
          TabOrder = 0
          OnClick = BFGroupClick
        end
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 208
    object MenuItem_File: TMenuItem
      Caption = 'File'
      object MenuItem_Exit: TMenuItem
        Caption = 'Exit'
      end
    end
    object MenuItem_Help: TMenuItem
      Caption = 'Help'
      object ReleaseNotes: TMenuItem
        Caption = 'Release Notes'
        OnClick = ReleaseNotesClick
      end
      object MenuItem_About: TMenuItem
        Caption = 'About'
        OnClick = MenuItem_AboutClick
      end
    end
  end
end

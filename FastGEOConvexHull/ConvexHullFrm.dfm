object ConvexHullForm: TConvexHullForm
  Left = 320
  Top = 219
  Width = 1088
  Height = 750
  Caption = 'Convex Hull - By Arash Partow'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 49
    Width = 1081
    Height = 16
    Cursor = crHSplit
    Align = alCustom
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1080
    Height = 73
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 96
      Top = 13
      Width = 99
      Height = 13
      Caption = 'Convex Hull Strategy'
    end
    object GenRandPntsBtn: TButton
      Left = 360
      Top = 8
      Width = 145
      Height = 33
      Caption = 'Generate Random Points'
      TabOrder = 0
      OnClick = GenRandPntsBtnClick
    end
    object DisplayCHullBtn: TButton
      Left = 528
      Top = 8
      Width = 129
      Height = 33
      Caption = 'Display Convex Hull'
      TabOrder = 1
      OnClick = DisplayCHullBtnClick
    end
    object PointCountComboBox: TComboBox
      Left = 8
      Top = 10
      Width = 73
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 3
      TabOrder = 2
      Text = '10'
      OnChange = PointCountComboBoxChange
      Items.Strings = (
        '3'
        '4'
        '5'
        '10'
        '50'
        '100'
        '150'
        '200'
        '250'
        '300'
        '350'
        '400'
        '500'
        '800'
        '1000'
        '10000'
        '20000'
        '30000'
        '40000'
        '50000'
        '60000'
        '100000'
        '500000'
        '1000000')
    end
    object BeginTestButton: TButton
      Left = 672
      Top = 8
      Width = 105
      Height = 33
      Caption = 'Begin Test'
      TabOrder = 3
      OnClick = BeginTestButtonClick
    end
    object StopTestButton: TButton
      Left = 792
      Top = 8
      Width = 105
      Height = 33
      Caption = 'Stop Test'
      TabOrder = 4
      OnClick = StopTestButtonClick
    end
    object TestCounterEdit: TEdit
      Left = 952
      Top = 16
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 5
    end
    object CHStrategyComboBox: TComboBox
      Left = 200
      Top = 10
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 6
      Text = 'Graham Scan'
      Items.Strings = (
        'Graham Scan'
        'Quick Hull')
    end
    object DrawCheckBox: TCheckBox
      Left = 8
      Top = 48
      Width = 105
      Height = 17
      Caption = 'Draw Hull & Points'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object PostScriptCheckBox: TCheckBox
      Left = 120
      Top = 48
      Width = 257
      Height = 17
      Caption = 'Produce encapsulated postscript document (eps)'
      TabOrder = 8
    end
    object StdOutputCheckBox: TCheckBox
      Left = 392
      Top = 48
      Width = 145
      Height = 17
      Caption = 'Produce Standard Output'
      TabOrder = 9
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 697
    Width = 1080
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 1080
    Height = 624
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object Surface: TPaintBox
      Left = 2
      Top = 2
      Width = 1076
      Height = 620
      Align = alClient
    end
  end
end

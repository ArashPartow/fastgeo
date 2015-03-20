object OrderedPolygonForm: TOrderedPolygonForm
  Left = 649
  Top = 535
  Width = 946
  Height = 631
  Caption = 'Ordered Polygon - By Arash Partow 2000'
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
    Top = 56
    Width = 937
    Height = 17
    Cursor = crHSplit
    Align = alCustom
  end
  object Panel1: TPanel
    Left = 0
    Top = 57
    Width = 938
    Height = 521
    Align = alClient
    TabOrder = 0
    object Surface: TPaintBox
      Left = 1
      Top = 1
      Width = 936
      Height = 519
      Align = alClient
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 578
    Width = 938
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 938
    Height = 57
    Align = alTop
    TabOrder = 2
    DesignSize = (
      938
      57)
    object GenRandPntsBtn: TButton
      Left = 16
      Top = 8
      Width = 145
      Height = 41
      Caption = 'Generate Random Points'
      TabOrder = 0
      OnClick = GenRandPntsBtnClick
    end
    object DispEdgeBtn: TButton
      Left = 396
      Top = 8
      Width = 145
      Height = 41
      Anchors = [akTop]
      Caption = 'Display Edges'
      TabOrder = 1
      OnClick = DispEdgeBtnClick
    end
    object OrdPolyBtn: TButton
      Left = 776
      Top = 8
      Width = 145
      Height = 41
      Anchors = [akTop, akRight]
      Caption = 'Order Polygon'
      TabOrder = 2
      OnClick = OrdPolyBtnClick
    end
  end
end

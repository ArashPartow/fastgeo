object BarycentricForm: TBarycentricForm
  Left = 218
  Top = 194
  Width = 1311
  Height = 893
  BorderWidth = 1
  Caption = 'FastGEO Barycentric Coordinate Demo - By Arash Partow 2001'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Paint: TPaintBox
    Left = 0
    Top = 0
    Width = 1072
    Height = 838
    Align = alClient
    OnMouseMove = PaintMouseMove
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 838
    Width = 1301
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 1072
    Top = 0
    Width = 229
    Height = 838
    Align = alRight
    Alignment = taLeftJustify
    TabOrder = 1
    object Label8: TLabel
      Left = 18
      Top = 344
      Width = 71
      Height = 20
      Align = alCustom
      Caption = 'DeltaX ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 18
      Top = 376
      Width = 71
      Height = 20
      Align = alCustom
      Caption = 'DeltaY ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 46
      Top = 288
      Width = 43
      Height = 20
      Align = alCustom
      Caption = 'm.y ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 65
      Top = 40
      Width = 24
      Height = 20
      Align = alCustom
      Caption = 'v ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 50
      Top = 176
      Width = 39
      Height = 20
      Align = alCustom
      Caption = 'b.x ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 46
      Top = 256
      Width = 43
      Height = 20
      Align = alCustom
      Caption = 'm.x ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 50
      Top = 208
      Width = 39
      Height = 20
      Align = alCustom
      Caption = 'b.y ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 61
      Top = 72
      Width = 28
      Height = 20
      Align = alCustom
      Caption = 'w ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 63
      Top = 8
      Width = 26
      Height = 20
      Align = alCustom
      Caption = 'u ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 61
      Top = 112
      Width = 28
      Height = 20
      Align = alCustom
      Caption = 'E ='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object WEdit: TEdit
      Left = 96
      Top = 72
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object MYEdit: TEdit
      Left = 96
      Top = 288
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object VEdit: TEdit
      Left = 96
      Top = 40
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object UEdit: TEdit
      Left = 96
      Top = 8
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object MXEdit: TEdit
      Left = 96
      Top = 256
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object DeltaYEdit: TEdit
      Left = 96
      Top = 376
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
    object DeltaXEdit: TEdit
      Left = 96
      Top = 344
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 6
    end
    object BYEdit: TEdit
      Left = 96
      Top = 208
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 7
    end
    object BXEdit: TEdit
      Left = 96
      Top = 176
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 8
    end
    object BaryTotalEdit: TEdit
      Left = 96
      Top = 112
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 9
    end
    object ReGenButton: TButton
      Left = 104
      Top = 432
      Width = 113
      Height = 25
      Caption = 'Regenerate Triangle'
      TabOrder = 10
      OnClick = ReGenButtonClick
    end
  end
end

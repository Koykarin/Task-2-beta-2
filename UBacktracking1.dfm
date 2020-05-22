object Form1: TForm1
  Left = 435
  Top = 211
  Width = 846
  Height = 330
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblResult: TLabel
    Left = 24
    Top = 232
    Width = 43
    Height = 19
    Caption = 'Result'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblRoads: TLabel
    Left = 8
    Top = 40
    Width = 57
    Height = 18
    Caption = 'Roads'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblMinimalRoads: TLabel
    Left = 424
    Top = 40
    Width = 87
    Height = 18
    Caption = 'MinimalRoads'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Cities: TStringGrid
    Left = 0
    Top = 64
    Width = 401
    Height = 161
    ColCount = 6
    RowCount = 6
    TabOrder = 0
    ColWidths = (
      64
      64
      65
      64
      64
      64)
  end
  object btnResult: TButton
    Left = 144
    Top = 0
    Width = 137
    Height = 33
    Caption = 'Result'
    TabOrder = 1
    OnClick = btnResultClick
  end
  object edtResult: TEdit
    Left = 0
    Top = 256
    Width = 241
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object btnPrintRoads: TButton
    Left = 16
    Top = 0
    Width = 105
    Height = 33
    Caption = 'PrintRoads'
    TabOrder = 3
    OnClick = PrintRoadsClick
  end
  object MinCitRoads: TStringGrid
    Left = 416
    Top = 64
    Width = 401
    Height = 161
    ColCount = 6
    RowCount = 6
    TabOrder = 4
    ColWidths = (
      64
      64
      65
      64
      64
      64)
  end
end

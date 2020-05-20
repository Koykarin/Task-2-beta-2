object Form1: TForm1
  Left = 804
  Top = 271
  Width = 652
  Height = 537
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
    Left = 40
    Top = 336
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
  object Cities: TStringGrid
    Left = 0
    Top = 56
    Width = 449
    Height = 265
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
    Left = 32
    Top = 360
    Width = 225
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
end

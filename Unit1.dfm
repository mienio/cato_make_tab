object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Form1'
  ClientHeight = 373
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button5: TButton
    Left = 8
    Top = 344
    Width = 538
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button5Click
  end
  object richedit1: TMemo
    Left = 16
    Top = 16
    Width = 546
    Height = 322
    Lines.Strings = (
      'richedit1')
    MaxLength = 999999
    TabOrder = 1
    WordWrap = False
  end
  object Button1: TButton
    Left = 537
    Top = 344
    Width = 25
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
end

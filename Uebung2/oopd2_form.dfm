object FmOOPD2: TFmOOPD2
  Left = 410
  Top = 334
  Width = 946
  Height = 336
  Caption = 'FmOOPD2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_eName: TLabel
    Left = 32
    Top = 24
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object lbl_eAnrede: TLabel
    Left = 24
    Top = 64
    Width = 37
    Height = 17
    Caption = 'Anrede:'
  end
  object lbl_eGeburtstag: TLabel
    Left = 8
    Top = 96
    Width = 55
    Height = 13
    Caption = 'Geburtstag:'
  end
  object lbl_eStrasse: TLabel
    Left = 32
    Top = 136
    Width = 34
    Height = 13
    Caption = 'Straﬂe:'
  end
  object lbl_ePLZ: TLabel
    Left = 40
    Top = 176
    Width = 23
    Height = 13
    Caption = 'PLZ:'
  end
  object lbl_eOrt: TLabel
    Left = 48
    Top = 216
    Width = 17
    Height = 13
    Caption = 'Ort:'
  end
  object eName: TEdit
    Left = 72
    Top = 24
    Width = 129
    Height = 25
    TabOrder = 0
  end
  object eGeburtstag: TEdit
    Left = 72
    Top = 96
    Width = 129
    Height = 25
    TabOrder = 2
  end
  object btnSpeichern: TButton
    Left = 96
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Speichern'
    TabOrder = 6
    OnClick = btnSpeichernClick
  end
  object lstKunden: TListView
    Left = 216
    Top = 24
    Width = 699
    Height = 217
    Columns = <
      item
        Caption = 'DSN'
        Width = 240
      end
      item
        Caption = 'Nummer'
        Width = 55
      end
      item
        Caption = 'Name'
        Width = 125
      end
      item
        Caption = 'Anrede'
      end
      item
        Caption = 'Geburtstag'
        Width = 75
      end
      item
        Caption = 'Anschrift'
        Width = 100
      end>
    TabOrder = 7
    ViewStyle = vsReport
  end
  object eStrasse: TEdit
    Left = 72
    Top = 136
    Width = 129
    Height = 25
    TabOrder = 3
  end
  object ePLZ: TEdit
    Left = 72
    Top = 176
    Width = 129
    Height = 25
    TabOrder = 4
  end
  object eOrt: TEdit
    Left = 72
    Top = 216
    Width = 129
    Height = 25
    TabOrder = 5
  end
  object cbAnrede: TComboBox
    Left = 72
    Top = 64
    Width = 129
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'Bitte w‰hlen Sie aus...'
    Items.Strings = (
      'Frau'
      'Herr'
      'Dr.'
      'Prof.'
      'Dipl.')
  end
end

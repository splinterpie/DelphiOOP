object FmSpielen: TFmSpielen
  Left = 603
  Top = 300
  Width = 537
  Height = 271
  Caption = 'Klassen, Kapselung und Vererbung'
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
  object eName: TEdit
    Left = 24
    Top = 24
    Width = 97
    Height = 21
    TabOrder = 0
    Text = 'Name'
  end
  object eAlter: TEdit
    Left = 24
    Top = 56
    Width = 97
    Height = 21
    TabOrder = 1
    Text = 'Alter'
  end
  object eBafoeg: TEdit
    Left = 24
    Top = 152
    Width = 97
    Height = 21
    TabOrder = 2
    Text = 'Bafög'
    Visible = False
  end
  object eFach: TEdit
    Left = 24
    Top = 120
    Width = 97
    Height = 21
    TabOrder = 3
    Text = 'Fach'
    Visible = False
  end
  object cbTaetigkeit: TComboBox
    Left = 24
    Top = 88
    Width = 97
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'Taetigkeit'
    OnChange = cbTaetigkeitChange
  end
  object eBeruf: TEdit
    Left = 24
    Top = 120
    Width = 97
    Height = 21
    TabOrder = 5
    Text = 'Beruf'
    Visible = False
  end
  object eGehalt: TEdit
    Left = 24
    Top = 152
    Width = 97
    Height = 21
    TabOrder = 6
    Text = 'Gehalt'
    Visible = False
  end
  object btnCreate: TButton
    Left = 32
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Speichern'
    Enabled = False
    TabOrder = 7
    OnClick = btnCreateClick
  end
  object lstTaetigkeit: TListView
    Left = 136
    Top = 24
    Width = 369
    Height = 150
    Columns = <
      item
        Caption = 'Name'
        Width = 90
      end
      item
        Caption = 'Alter'
      end
      item
        Caption = 'Taetigkeit'
        Width = 75
      end
      item
        Caption = 'Fachrichtung'
        Width = 75
      end
      item
        Caption = 'Einkommen'
        Width = 75
      end>
    TabOrder = 8
    ViewStyle = vsReport
  end
end

unit oopd2_form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OOPD2_Datensatz, OOPD2_Adresse, OOPD2_Kunde, StdCtrls, ComCtrls;

type
  TFmOOPD2 = class(TForm)
    eName: TEdit;
    eGeburtstag: TEdit;
    eStrasse: TEdit;
    ePLZ: TEdit;
    eOrt: TEdit;
    btnSpeichern: TButton;
    lstKunden: TListView;
    cbAnrede: TComboBox;
    lbl_eName: TLabel;
    lbl_eAnrede: TLabel;
    lbl_eGeburtstag: TLabel;
    lbl_eStrasse: TLabel;
    lbl_ePLZ: TLabel;
    lbl_eOrt: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSpeichernClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
    function EingabeSicher: Boolean;
    procedure ListFuellen(datensatz: TDatensatz; adresse: TAdresse);
  public
    { Public-Deklarationen }
  end;

var
  FmOOPD2: TFmOOPD2;

implementation

var
  kunden: array of TKunde;
  adressen: array of TAdresse;
  Anrede: TAnrede;

{$R *.DFM}


// Objekte freigeben
procedure TFmOOPD2.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  if length(kunden) > 0 then
  begin
    SetLength(kunden, length(kunden));
    for i:=0 to length(kunden)-1 do
      kunden[i].Free;
  end;

  if length(adressen) > 0 then
  begin
    SetLength(adressen, length(adressen));
    for i:=0 to length(adressen)-1 do
      adressen[i].Free;
  end;
end;

// Fuellt die Listview mit Objektdaten
procedure TFmOOPD2.ListFuellen(datensatz: TDatensatz; adresse: TAdresse);
var
  item: TListItem;
begin
  item := lstKunden.Items.Add;
  item.Caption := datensatz.getDSN;
  if datensatz is TKunde then
  begin
    item.SubItems.Add((datensatz as TKunde).formatKundenNummer(((datensatz as TKunde).getKundenNummer)));
    item.SubItems.Add((datensatz as TKunde).getName);
    item.SubItems.Add((datensatz as TKunde).getAnrede);                
    item.SubItems.Add((datensatz as TKunde).getAlter);
    item.SubItems.Add((datensatz as TKunde).getKundeZuAnschrift(adresse));
  end;
end;

// Prueft ob die Edit-Felder leer sind
function TFmOOPD2.EingabeSicher: Boolean;
var
  bZuweisung: Boolean;
begin
  bZuweisung := True;
  if (eName.Text = '') or (cbAnrede.Text = '') or (eGeburtstag.Text = '') or (eStrasse.Text = '') or (ePLZ.Text = '') or (eOrt.Text = '') then
    bZuweisung := False;
  Result := bZuweisung;
end;

// Objekte erzeugen und Aufruf von ListFuellen(object)
procedure TFmOOPD2.btnSpeichernClick(Sender: TObject);
var
  i: Integer;
begin
  if EingabeSicher then
  begin
    // Kunden
    setlength(kunden, length(kunden)+1);
    i := length(kunden)-1;
    kunden[i] := TKunde.Create(i+1, eName.Text, kunden[i].setAnrede(Anrede, cbAnrede.ItemIndex), StrToDate(eGeburtstag.Text));
    // Adressen
    setlength(adressen, length(adressen)+1);
    i := length(adressen)-1;
    adressen[i] := TAdresse.Create(eStrasse.Text, StrToInt(ePLZ.Text), eOrt.Text);

    ListFuellen(kunden[i], adressen[i]);
  end
  else
    MessageDlg('Bitte geben Sie Werte in alle Eingabefelder ein.', mtError, [mbOk], 0);
end;

// Die Combobox manuell auf Read-Only setzen
procedure TFmOOPD2.FormCreate(Sender: TObject);
begin
  SendMessage(GetWindow(cbAnrede.Handle,GW_CHILD), EM_SETREADONLY, 1, 0);
end;

end.

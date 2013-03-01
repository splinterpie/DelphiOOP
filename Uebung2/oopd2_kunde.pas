unit OOPD2_Kunde;

interface

uses
  Classes, SysUtils, Controls, oopd2_datensatz, oopd2_adresse;

type
  TAnrede = (Frau, Herr, Dr, Prof, Dipl);
  TKunde = class(TDatensatz)
  private
    iNummer: Integer;
    sName: String;
    enumAnrede: TAnrede;
    dGeburtsdatum: TDateTime;
  public
    constructor Create(nummer: Integer; name: String; anrede: TAnrede; geburtstag: TDate);
    destructor Free;
    function getKundenNummer: Integer;
    function formatKundenNummer(kundennummer:Integer): String;
    function getName: String;
    function getAnrede: String;
    function setAnrede(anrede: TAnrede; anredeIndex: Integer): TAnrede;
    function getAlter: String;
    function getKundeZuAnschrift(anschrift: TAdresse): String;
  end;

implementation


{ TKunde }

constructor TKunde.Create(nummer: Integer; name: String; anrede: TAnrede; geburtstag: TDate);
begin
  inherited Create;
  iNummer := nummer;
  sName := name;
  enumAnrede := anrede;
  dGeburtsdatum := geburtstag;    
end;

destructor TKunde.Free;
begin
end;

function TKunde.getKundenNummer: Integer;
begin
  Result := iNummer;
end;

function TKunde.formatKundenNummer(kundennummer:Integer): String;
var
  sKundenNummer: String;
begin
  sKundenNummer := IntToStr(kundennummer);
  if length(sKundenNummer) < 2 then
    sKundenNummer := '000' + sKundenNummer

  else if length(sKundenNummer) < 3 then
    sKundenNummer := '00' + sKundenNummer

  else if length(sKundenNummer) < 4 then
    sKundenNummer := '0' + sKundenNummer;

  Result := sKundenNummer
end;

function TKunde.getName: String;
begin
  Result := sName;
end;

function TKunde.getAnrede: String;
begin
  case enumAnrede of
    Frau: Result := 'Frau';
    Herr: Result := 'Herr';
    Dr:   Result := 'Dr.';
    Prof: Result := 'Prof.';
    Dipl: Result := 'Dipl.';
  end;
end;

function TKunde.setAnrede(anrede: TAnrede; anredeIndex: Integer): TAnrede;
begin
  case anredeIndex of
    0: anrede := Frau;
    1: anrede := Herr;
    2: anrede := Dr;
    3: anrede := Prof;
    4: anrede := Dipl;
  end;
  Result := anrede;
end;

function TKunde.getAlter: String;
begin
  Result := DateToStr(dGeburtsdatum);

end;

function TKunde.getKundeZuAnschrift(anschrift: TAdresse): String;
begin
  Result := anschrift.getStrasse;
end;

end.


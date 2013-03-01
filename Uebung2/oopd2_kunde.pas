unit OOPD2_Kunde;

interface

uses
  Classes, SysUtils, Controls, oopd2_datensatz, oopd2_adresse, Dialogs;

type
  TAnrede = (Frau, Herr, Dr, Prof, Dipl);
  TKunde = class(TDatensatz)
  private
    iNummer: Integer; //Format: 0001, 0002, 0003 usw.
    sName: String;
    enumAnrede: TAnrede;
    dGeburtsdatum: TDateTime;
  public
    constructor Create(nummer: Integer; name: String; anrede: TAnrede; geburtstag: TDate);
    destructor Free;
    function getKundenNummer: Integer;
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


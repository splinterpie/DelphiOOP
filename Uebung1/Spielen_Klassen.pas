unit Spielen_Klassen;

interface

uses
  SysUtils;

type
  TMensch = class(TObject)
  private
    sName: String;
    iAlter: Integer;
  public
    constructor Create(name: String; alter: Integer);
    property Name: String read sName write sName;
    property Alter: Integer read iAlter write iAlter;
  end;

  TBerufstaetig = class(TMensch)
  private
    sBranche: String;
    // Monatsgehalt
    fGehalt: Single;
    function getEinkommen: Single;
    procedure setEinkommen(einkommen: Single);
  public
    constructor Create(name: String; alter: Integer; branche: String; gehalt: Single);
    property Branche: String read sBranche write sBranche;
    // Jahreseinkommen
    property Einkommen: Single read getEinkommen write setEinkommen;
  end;

  TStudent = class(TMensch)
  private
    sFach: String;
    // Monatliches Einkommen
    fBafoeg: Single;
    function getEinkommen: Single;
    procedure setEinkommen(einkommen: Single);
  public
    constructor Create(name: String; alter: Integer; fach: String; bafoeg: Single);
    property Fach: String read sFach write sFach;
    // Jahreseinkommen
    property Einkommen: Single read getEinkommen write setEinkommen;
  end;

implementation


{ TMensch }

constructor TMensch.Create(name: String; alter: Integer);
begin
  sName := name;
  iAlter := alter;
end;


{ TBerufstaetig }

constructor TBerufstaetig.Create(name: String; alter: Integer;
  branche: String; gehalt: Single);
begin
  inherited Create(name, alter);
  sBranche := Branche;
  fGehalt := gehalt;
end;

// Berechnet das Jahreseinkommen aus Feld fGehalt
function TBerufstaetig.getEinkommen: Single;
const
  // Einkommenssteuersätze für 2013
  fGrundfreibetrag = 8004;
  fEingangssteuersatz = 0.86;
  fProgressionsende1 = 52882;
  fSpitzensteuersatz1 = 0.58;
  fProgressionsende2 = 250731;
  fSpitzensteuersatz2 = 0.55;
var
  fEinkommenOhneSteuern: Single;
begin
  fEinkommenOhneSteuern := 12 * fGehalt;
  if fGehalt < fGrundfreibetrag then
    Result := fEinkommenOhneSteuern
  else if fGehalt < fProgressionsende1 then
    Result := fEinkommenOhneSteuern * fEingangssteuersatz
  else if fGehalt < fProgressionsende2 then
    Result := fEinkommenOhneSteuern * fSpitzensteuersatz1
  else
    Result := fEinkommenOhneSteuern * fSpitzensteuersatz2;
end;

// Schreibt das gegebene Jahreseinkommen ins Feld fGehalt
procedure TBerufstaetig.setEinkommen(einkommen: Single);
begin
  fGehalt := einkommen / 12;
end;


{ TStudent }

constructor TStudent.Create(name: String; alter: Integer; fach: String;
  bafoeg: Single);
begin
 inherited Create(name, alter);
 sFach := fach;
 fBafoeg := bafoeg;
end;

// Berechnet das Jahreseinkommen aus Feld fBafoeg
function TStudent.getEinkommen: Single;
begin
  Result := fBafoeg * 12;
end;

// Schreibt das gegebene Jahreseinkommen ins Feld fBafoeg
procedure TStudent.setEinkommen(einkommen: Single);
begin
  fBafoeg := einkommen / 12;
end;

end.

unit OOPD2_Adresse;

interface

uses
  Classes, SysUtils, oopd2_datensatz;

type
  TAdresse = class(TDatensatz)
  private
    sStrasse: String;
    iPLZ: Integer;
    sOrt: String;
  public
    constructor Create(strasse: String; plz: Integer; ort: String);
    destructor Free;
    function getStrasse: String;
    function getPLZ: Integer;
    function getOrt: String;
  end;

implementation


{ TAdresse }

constructor TAdresse.Create(strasse: String; plz: Integer; ort: String);
begin
  inherited Create;
  sStrasse := strasse;
  iPLZ := plz;
  sOrt := ort;
end;

destructor TAdresse.Free;
begin
end;

function TAdresse.getOrt: String;
begin
  Result := sOrt;
end;

function TAdresse.getPLZ: Integer;
begin
  Result := iPLZ;
end;

function TAdresse.getStrasse: String;
begin
  Result := sStrasse;
end;

end.


unit oopd2_datensatz; 

interface

uses
  Classes, SysUtils, Comobj, ActiveX;

type
  TDatensatz = class(TObject)
  private
    DSN: String;
  public
    constructor Create;
    destructor Free;
    function getDSN: String;
  end;

implementation


{ TDatensatz }

constructor TDatensatz.Create;
var
  ID: TGUID;
begin
  CoCreateGUID(ID);
  DSN := GUIDToString(ID);
end;

destructor TDatensatz.Free;
begin
end;

function TDatensatz.getDSN;
begin
  result := DSN;
end;


end.


program OOSpielen;

uses
  Forms,
  Spielen_Form in 'Spielen_Form.pas' {FmSpielen},
  Spielen_Klassen in 'Spielen_Klassen.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmSpielen, FmSpielen);
  Application.Run;
end.

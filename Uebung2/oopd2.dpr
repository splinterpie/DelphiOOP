program oopd2;

uses
  Forms,
  oopd2_form in 'oopd2_form.pas' {FmOOPD2},
  oopd2_datensatz in 'oopd2_datensatz.pas',
  OOPD2_Adresse in 'oopd2_adresse.pas',
  OOPD2_Kunde in 'oopd2_kunde.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmOOPD2, FmOOPD2);
  Application.Run;
end.

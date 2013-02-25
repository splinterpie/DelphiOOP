unit Spielen_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Menus, Grids;

type
  TFmSpielen = class(TForm)
    lblMenschAName: TLabel;
    lblMenschBName: TLabel;
    lblMenschAAlter: TLabel;
    lblMenschBAlter: TLabel;
    lblBName: TLabel;
    lblStudentInName: TLabel;
    lblBAlter: TLabel;
    lblStudentInAlter: TLabel;
    lblBEinkommen: TLabel;
    lblStudentInEinkommen: TLabel;
    eName: TEdit;
    eAlter: TEdit;
    eBafoeg: TEdit;
    eFach: TEdit;
    cbTaetigkeit: TComboBox;
    eBeruf: TEdit;
    eGehalt: TEdit;
    btnCreate: TButton;
    memTaetigkeit: TMemo;
    procedure MemoFuellen;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbTaetigkeitChange(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FmSpielen: TFmSpielen;

implementation

uses
  Spielen_Klassen;

var
  Maxi, Klaus: TStudent;
  Gerhard, Mareike: TBerufstaetig;

  studenten: array of TStudent;
  berufstaetige: array of TBerufstaetig;


{$R *.DFM}


procedure TFmSpielen.MemoFuellen;;
begin
  // Name
  lblMenschAName.Caption   := Klaus.Name;
  lblMenschBName.Caption   := Mareike.Name;
  lblBName.Caption         := Gerhard.Name;
  lblStudentInName.Caption := Maxi.Name;

  // Alter
  lblMenschAAlter.Caption   := IntToStr(Klaus.Alter);
  lblMenschBAlter.Caption   := IntToStr(Mareike.Alter);
  lblBAlter.Caption         := IntToStr(Gerhard.Alter);
  lblStudentInAlter.Caption := IntToStr(Maxi.Alter);

  // Einkommen
  lblBEinkommen.Caption := FloatToStr(Gerhard.Einkommen);
  lblStudentInEinkommen.Caption := FloatToStr(Maxi.Einkommen);

  memTaetigkeit.Lines.AddObject

end;

// Constructoraufruf und Labels fuellen
procedure TFmSpielen.FormCreate(Sender: TObject);
begin
  Klaus := TStudent.Create('Klaus Mueller', 31, 'Phlosophie', 350);
  Maxi := TStudent.Create('Maxi Mustermensch', 999, 'BWL', 400);
  Gerhard := TBerufstaetig.Create('Gerhard Schroeder', 64, 'Lobbyist', 10000);
  Mareike := TBerufstaetig.Create('Mareike Meier', 55, 'CEO', 500000);
  LabelsFuellen;

  cbTaetigkeit.Items.Append('studierend');
  cbTaetigkeit.Items.Append('berufstätig');
end;

// Destruktoraufruf
procedure TFmSpielen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Klaus.Free;
  Mareike.Free;
  Maxi.Free;
  Gerhard.Free;
end;

procedure TFmSpielen.cbTaetigkeitChange(Sender: TObject);
begin
  if cbTaetigkeit.ItemIndex = 0 then
  begin
    eFach.Visible := True;
    eBafoeg.Visible := True;
    eBeruf.Visible := False;
    eGehalt.Visible := False;
    btnCreate.Enabled := True;
  end
  else if cbTaetigkeit.ItemIndex = 1 then
  begin
    eBeruf.Visible := True;
    eGehalt.Visible := True;
    eFach.Visible := False;
    eBafoeg.Visible := False;
    btnCreate.Enabled := True;
  end
  else
  begin
    eBeruf.Visible := False;
    eGehalt.Visible := False;
    eFach.Visible := False;
    eBafoeg.Visible := False;
    btnCreate.Enabled := False;
  end;
end;

procedure TFmSpielen.btnCreateClick(Sender: TObject);
var
 idx: integer;
begin
  if cbTaetigkeit.ItemIndex = 0 then
  begin
    setlength(studenten, length(studenten)+1);
    idx := length(studenten)-1;
    studenten[idx] := TStudent.Create(eName.Text, StrToInt(eAlter.Text), eFach.Text, StrToFloat(eBafoeg.Text));
  end
  else if cbTaetigkeit.ItemIndex = 1 then
  begin
    setlength(berufstaetige, length(berufstaetige)+1);
    idx := length(berufstaetige)-1;
    berufstaetige[idx] := TBerufstaetig.Create(eName.Text, StrToInt(eAlter.Text), eBeruf.Text, StrToFloat(eGehalt.Text));
  end;
end;

end.

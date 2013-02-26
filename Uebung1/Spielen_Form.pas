unit Spielen_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Menus, Grids, Spielen_Klassen;

type
  TFmSpielen = class(TForm)
    eName: TEdit;
    eAlter: TEdit;
    eBafoeg: TEdit;
    eFach: TEdit;
    cbTaetigkeit: TComboBox;
    eBeruf: TEdit;
    eGehalt: TEdit;
    btnCreate: TButton;
    lstTaetigkeit: TListView;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbTaetigkeitChange(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
  private
    procedure ListFuellen(mensch: TMensch);
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FmSpielen: TFmSpielen;

implementation

var
  Maxi, Klaus: TStudent;
  Gerhard, Mareike: TBerufstaetig;

  studenten: array of TStudent;
  berufstaetige: array of TBerufstaetig;


{$R *.DFM}


procedure TFmSpielen.ListFuellen(mensch: TMensch);
var
   item : TListItem;
begin
  Item := lstTaetigkeit.Items.Add;
  if mensch is TStudent then
  begin
    item.Caption := mensch.Name;;
    item.SubItems.Add(IntToStr(mensch.Alter));
    item.SubItems.Add('studierend');
    item.SubItems.Add((mensch as TStudent).Fach);
    item.SubItems.Add(FloatToStr((mensch as TStudent).Einkommen));
  end
  else if mensch is TBerufstaetig then
  begin
    item.Caption := mensch.Name;;
    item.SubItems.Add(IntToStr(mensch.Alter));
    item.SubItems.Add('berufstaetig');
    item.SubItems.Add((mensch as TBerufstaetig).Branche);
    item.SubItems.Add(FloatToStr((mensch as TBerufstaetig).Einkommen));
  end;
end;

// Constructoraufruf und Labels fuellen
procedure TFmSpielen.FormCreate(Sender: TObject);
begin
  cbTaetigkeit.Items.Append('studierend');
  cbTaetigkeit.Items.Append('berufstätig');
end;

// Destruktoraufruf
procedure TFmSpielen.FormClose(Sender: TObject; var Action: TCloseAction);
var
  idx: Integer;
begin
  if length(studenten) > 0 then
  begin
    setlength(studenten, length(studenten));
    for idx:=0 to length(studenten)-1 do
      studenten[idx].Free;
  end;
  if  length(berufstaetige) > 0 then
  begin
    setlength(berufstaetige, length(berufstaetige));
    for idx:=0 to length(berufstaetige)-1 do
      berufstaetige[idx].Free;
  end;
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
    ListFuellen(studenten[idx]);
  end
  else if cbTaetigkeit.ItemIndex = 1 then
  begin
    setlength(berufstaetige, length(berufstaetige)+1);
    idx := length(berufstaetige)-1;
    berufstaetige[idx] := TBerufstaetig.Create(eName.Text, StrToInt(eAlter.Text), eBeruf.Text, StrToFloat(eGehalt.Text));
    ListFuellen(berufstaetige[idx]);
  end;
end;

end.

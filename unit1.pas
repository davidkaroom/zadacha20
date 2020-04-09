unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    MainMenu1: TMainMenu;
    FileU: TMenuItem;
    HELPF: TMenuItem;
    CLOSEF: TMenuItem;
    OPENF: TMenuItem;
    SAVEF: TMenuItem;
    SAVEAS: TMenuItem;
    OpenDialog1: TOpenDialog;
    Podskazka3: TLabel;
    Memo1: TMemo;
    SaveDialog1: TSaveDialog;
    VA: TEdit;
    VD: TEdit;
    VN: TEdit;
    Podskazka: TLabel;
    Podskazka1: TLabel;
    Podskazka2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HELPFClick(Sender: TObject);
    procedure CLOSEFClick(Sender: TObject);
    procedure OPENFClick(Sender: TObject);
    procedure SAVEASClick(Sender: TObject);
    procedure SAVEFClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Lines.Clear;
  VA.Text:=FloatToStr(1);
  VD.Text:=FloatToStr(2);
  VN.Text:=FloatToStr(3);
end;


procedure TForm1.HELPFClick(Sender: TObject);
begin
   ShowMessage('Программа вычисляет сумму арифметической прогрессии по формуле [s:=((2*a+(n-1)*d)*n) / 2 ]  Автор: Бурдуковский Давид');
end;

procedure TForm1.CLOSEFClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.OPENFClick(Sender: TObject);
  var FName,s,s1,s2: string;
  f:text;
  begin
  if OpenDialog1.Execute then
  begin
  FName := OpenDialog1.FileName;
  if FName <> '' then begin
  AssignFile(f,FName);
  Reset(f);
  readln(f,s);
  readln(f,s1);
  readln(f,s2);
  VA.Text:=s;
  VD.Text:=s1;
  VN.Text:=s2;
  end;
  closeFile(f);
  end;
  end;
procedure TForm1.SAVEASClick(Sender: TObject);
begin
  Memo1.Lines.SaveToFile( 'отчёт.txt');
end;

procedure TForm1.SAVEFClick(Sender: TObject);
  var FName,s,s1,s2: string;
f:text;
begin
if SaveDialog1.Execute then
FName := SaveDialog1.FileName;
if FName <> '' then begin
AssignFile(f,FName);
Append(f);
s:=VA.Text;
s1:=VD.Text;
s2:=VN.Text;
writeln(f,s);
writeln(f,s1);
writeln(f,s2);
closeFile(f);
end;
end;

procedure TForm1.Button1Click(Sender: TObject);
  var a,d,n,s:real;
begin
if TryStrToFloat(VA.Text, a) = false then
   begin
   ShowMessage('Неправильно введён параметр a');
   exit;
   end;
if TryStrToFloat(VD.Text, d) = false then
   begin
   ShowMessage('Неправильно введён параметр d');
   exit;
   end;
if TryStrToFloat(VN.Text, n) = false then
   begin
   ShowMessage('Неправильно введён параметр n');
   exit;
   end;
 a:=StrToFloat(VA.Text);
 d:=StrToFloat(VD.Text);
 N:=StrToFloat(VN.Text);
 s:=((2*a+(n-1)*d)*n) / 2;
 Memo1.Lines.Add('При a = '+FloatToStr(a)+' d = '+FloatToStr(d)+' n = '+FloatToStr(n));
 Memo1.Lines.Add('Сумма членов арифметической прогрессии равна '+ FloatToStr(s));
end;

end.


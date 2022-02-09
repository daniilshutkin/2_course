unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LAZUTF8;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private

  public

  end;

var
Form1: TForm1;
CBosn: string;//Данный знак
CBizm: string;//На который нужно поменять
i: integer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
     CBosn := ComboBox1.Text;//Запомнить исходный знак
end;

procedure TForm1.Button1Click(Sender: TObject);
var
smv,flag: integer;
st:string;
begin
if Memo1.Lines.Text = '' then Memo1.Lines.Text := ' ';
     Memo2.Clear;
st := Memo1.Lines.Text;
for smv := 1 to length(st) do
  if smv <= 100 then
  Begin
    flag := UTF8pos (COmboBox1.Text, st);
    UTF8delete(st,flag,1);
    UTF8insert(COmboBox2.Text,st,flag);
    Memo2.Lines.Text := st;
  End
  else
  Begin
    begin
      ShowMessage('Текст не может содержать более 60 символов!');
      Memo1.Clear;
      Memo2.Clear;
      exit;
    end;
  End;
  Memo2.Lines.SaveToFile('Data.txt');//Выгрузка Memo в файл
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
     CBizm := ComboBox2.Text;//Заменить на этот
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  if Memo1.Lines.Text = ' ' then ShowMessage('Это поле не может быть пустым!');
end;

end.


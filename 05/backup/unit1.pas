unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }



  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    {private declarations}
    procedure MyPrivat;
    procedure MyDouble;
  public
    {public declarations}
  end;

var
  Form1: TForm1;
  MyNum: real;

implementation

{$R *.lfm}

{ TForm1 }

procedure Udvoenie(st:string);
var r:real;
begin
r:= strToFloat(st);
r:= r*2;
ShowMessage(FloatToStr(r));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Udvoenie(Edit1.Text);
end;

function FuncUdvoenie(st: string): string;
var r: real;
begin
   r:= StrToFloat(st);
   r:= r * 2;
   Result:= FloatToStr(r);
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
     ShowMessage(FuncUdvoenie(Edit1.Text));
end;

procedure UdvoeniePoSsilke(var r: real);
begin
  r:= r * 2;
end;


procedure TForm1.Button3Click(Sender: TObject);
var myReal: real;
  begin
    myReal:= StrToFloat(Edit1.Text);
    UdvoeniePoSsilke(myReal);
    ShowMessage(FloatToStr(myReal));
    end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   MyPrivat;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  MyNum:= StrToFloat(Edit1.Text);
  MyDouble;
  ShowMessage(FloatToStr(MyNum));
end;

procedure TForm1.MyPrivat;
var r: real;
begin
  r:= StrToFloat(Edit1.Text);
  r:= r * 2;
  ShowMessage(FloatToStr(r));
end;

procedure TForm1.MyDouble;
begin
  MyNum:=MyNum*2;
end;

end.


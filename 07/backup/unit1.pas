unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Calendar, EditBtn,
  StdCtrls, LazUTF8;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Calendar1: TCalendar;
    DateEdit1: TDateEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
function UTF8ToSys(const s: string): string;
begin
  Result := LazUtf8.UTF8ToSys(s);
end;

procedure TForm1.Button1Click(Sender: TObject);
var Year, Month, Day: Word;
  s: String;
begin
  DecodeDate(Now, Year, Month, Day);
  ShowMessage('Год - ' + IntToStr(Year) + #13 + 'Месяц - ' + IntToStr(Month) + #13 + 'День - ' + IntToStr(Day));
end;

procedure TForm1.Button2Click(Sender: TObject);
var Year, Month, Day: Word;
  dt: TDateTime;
  s: String;
begin
  Year:= 1999;
  Month:= 3;
  Day:= 9;
  dt:= EncodeDate(Year, Month, Day);
  ShowMessage('Указали ' + SysToUTF8(FormatDateTime('dddddd', dt)));
end;

procedure TForm1.Button3Click(Sender: TObject);
var Year: Word;
begin
  Year:= 1917;
  if IsLeapYear(Year) then ShowMessage('Указан високосный год')
  else ShowMessage('Указан невисокосный год');
end;

procedure TForm1.Button4Click(Sender: TObject);
var dt: TDateTime;
begin
  dt:= StrToDateTime('21.10.2013 14:25:30');
  ShowMessage('Указали ' + FormatDateTime('c', dt));
end;

end.


unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
ExtCtrls, Buttons;

type
  CompInfo=record
index,top,left,width,height,fontsize:integer;
end;
complist=array of CompInfo;

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { private declarations }
DefWidth,defHeight:integer;
clist:complist;
  public
    { public declarations }

  end;

var
  Form1: TForm1;

implementation
uses math;

{$R *.lfm}

{ TForm1 }
procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
begin
defwidth:=width;
defheight:=height;
for i:= 0 to ComponentCount-1 do
if (Components[i].Classname = 'TRadioButton')
or (Components[i].Classname ='TCheckBox')
or (Components[i].Classname ='TButton')
or (Components[i].Classname ='TBitBtn')
or (Components[i].Classname ='TSpeedButton')
or (Components[i].Classname ='TEdit')
or (Components[i].Classname ='TRadioGroup')
or (Components[i].Classname ='TCheckGroup')
or (Components[i].Classname ='TListBox')
or (Components[i].Classname ='TComboBox')
or (Components[i].Classname ='TEdit')
or (Components[i].Classname ='TSpinEdit')
or (Components[i].Classname ='TLabel') then begin
setlength(clist,Length(clist)+1);
clist[Length(clist)-1].top:=(Components[i] as tcontrol).top;
clist[Length(clist)-1].left:=(Components[i]as tcontrol).left;
clist[Length(clist)-1].width:=(Components[i] as tcontrol).width;
clist[Length(clist)-1].height:=(Components[i]as tcontrol).height;
clist[Length(clist)-1].fontsize:=(Components[i]as tcontrol).font.Size;
clist[Length(clist)-1].index:=i;
end;
end;

procedure TForm1.FormResize(Sender: TObject);
var i:integer;
begin
if width >1000 then width:=800;
if width<150 then width:=250;
if height>800 then height:=800;
if height<150 then height:=250;
For i:=0 to length(clist)-1 do begin
(components[clist[i].index] as tcontrol).Top:=round(clist[i].top*height/defheight);
(components[clist[i].index] as tcontrol).height:=round(clist[i].height*height/defheight);
(components[clist[i].index] as tcontrol).left:=round(clist[i].left*width/defwidth);
(components[clist[i].index] as tcontrol).width:=round(clist[i].width*width/defwidth);
(components[clist[i].index] as tcontrol).font.Size:=round(clist[i].fontsize*min(width/defwidth,height/defheight));
end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var a:integer;
  s, d, S1: real;
begin
  a:= StrToInt(Edit1.text);
  s:= sqrt(a);
  d:= sqrt((sqr(s)+exp(a*ln(4)))/a);
  S1:= (Pi*0.5)*sqr(a);
  edit2.text:=floattostr(s);
  edit3.text:=floattostr(d);
  edit4.text:=floattostr(S1);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  edit1.text:='';
  edit2.text:='';
  edit3.text:='';
  edit4.text:='';
  edit1.setfocus;
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin

end;

end.


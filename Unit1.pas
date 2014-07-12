unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    Button5: TButton;
    richedit1: TMemo;
    Button1: TButton;

    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  tab: array[1..33,1..10582]of string;

implementation

{$R *.dfm}



procedure LoadGridFromStream(aStream: TStream; aGrid: TStringGrid);
var
  i, k: longint;
  iBuf: longint;
  S: string;

  function RdInt: longint;
  begin
    aStream.ReadBuffer(Result, Sizeof(Result));
  end;

begin
  with aGrid do
  begin
    ColCount := RdInt;
    RowCount := RdInt;
    for i := 0 to rowCount - 1 do
      for k := 0 to colCount - 1 do
      begin
        iBuf := RdInt;

        if iBuf > 0 then
        begin
          SetLength(S, iBuf);
          aStream.ReadBuffer(S[1], iBuf);
          Cells[k, i] := S;
        end;
      end;
  end;
end;




procedure TForm1.Button1Click(Sender: TObject);
begin
richedit1.Lines.LoadFromFile('db.txt');
end;

procedure TForm1.Button5Click(Sender: TObject);
var x,y,c:integer;
str,p:string;
s:ansistring;
plik:textfile;


begin
  assignfile(plik,richedit1.Lines.Count.ToString+'.txt');
  rewrite(plik);

 for x := 1 to richedit1.Lines.Count do
 begin
 s:=richedit1.Lines[x-1];
 str:='';
 c:=0;
   for y:=1 to length(S) do
   begin
   if s[y]<>chr(vk_tab) then str:=str+s[y]
   else
    begin

    c:=c+1;
    //zus if (c<>7) and (c<>8) and (c<>9) then
    //USIF c<7 then
    //miasta if (c<>19) and (c<>20) and (c<>21) and (c<>25) and (c<>26) and (c<>27) and (c<>28) and (c<>29) and (c<>31) and (c<>34) and (c<>35)  then
    // admin   if c<11 then
    // s¹d if (c=1) or (c=2) or (c=6) or (c=7) then
    // kody stare  if c<>4 then


   begin
    if c=1 then write( plik,'(');
    write(plik,quotedstr(str)+',');   //tab[c,x]:=str;
   end;
    str:='';
    end;

    if y=length(s) then
    begin
      c:=c+1;
//       writeln(plik,'),');   //tab[c,x]:=str;

    writeln(plik,quotedstr(str)+'),');   //tab[c,x]:=str;
     str:='';
    end;

   end;

 end;
beep;
closefile(plik);
end;


end.

unit UBacktracking1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

const maxN=5;

type
  TForm1 = class(TForm)
    Cities: TStringGrid;
    btnResult: TButton;
    edtResult: TEdit;
    btnPrintRoads: TButton;
    lblResult: TLabel;
    procedure PrintRoadsClick(Sender: TObject);
    procedure btnResultClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

type
    TIndex= 1..MaxN;
    TMatr= array[TIndex,TIndex]of integer;
    TSet= set of TIndex;


var
  Form1: TForm1;
  Roads:TMatr;   //дороги между городами

implementation

{$R *.dfm}

function RandomNum(n: integer): integer;
begin
  Randomize;
  repeat
    Result:= random(n);
    Sleep(1);
  until Result>0;
end;

 procedure FillRoads (var R:TMatr);
{Построение дорог}
var i, j: integer;
begin
 //двухсторонние
  for i := 1 to MaxN do
    begin
      R[i,i]:=0;
      for j := i+1 to MaxN do
        begin
          R[i,j]:= RandomNum(10) ;
          R[j,i]:= R[i,j];
        end;
    end;
end;

procedure PrintRoads (var R:TMatr; var C:TStringGrid);
var i, j: integer;
begin
for i := 1 to MaxN do
    for j:= 1 to maxN do
      C.Cells[i,j]:= IntToStr(R[i,j]);
end;


procedure TForm1.PrintRoadsClick(Sender: TObject);
var i: integer;
begin
  for i:=1 to maxN do
  begin
    cities.Cells[i,0]:= IntToStr(i);
    cities.Cells[0,i]:= IntToStr(i);
  end;
  FillRoads(Roads);
  PrintRoads(Roads, Cities);
end;

procedure TForm1.btnResultClick(Sender: TObject);
var i, j, minCity, minRoads, sum:integer;
begin
  minRoads:=1000;
  for i:=1 to maxN do
    begin
      sum:=0;
      for j:=1 to maxN do
        sum:= sum + Roads[i,j];
      if sum<minRoads then
        begin
          minRoads:= sum;
          minCity:=i;
        end;
    end;
  edtResult.Text:= IntToStr(minCity);
end;

end.

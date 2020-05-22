unit UBacktracking1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

const maxN=5;

type
  TIndex= 1..MaxN;
  TMatr= array[TIndex,TIndex]of integer;
  TSet= set of TIndex;
  TPath=array[TIndex] of TIndex;
  TForm1 = class(TForm)
    Cities: TStringGrid;
    btnResult: TButton;
    edtResult: TEdit;
    btnPrintRoads: TButton;
    lblResult: TLabel;
    MinCitRoads: TStringGrid;
    lblRoads: TLabel;
    lblMinimalRoads: TLabel;
    procedure PrintRoadsClick(Sender: TObject);
    procedure btnResultClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FindShortPath(start, finish:TIndex; LenthPath,LenOpt:Integer; visited: TSet);
  end;

//type




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
          R[i,j]:= RandomNum(100) ;
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

procedure TForm1.FindShortPath(start, finish:TIndex; LenthPath,LenOpt:Integer; visited: TSet);
begin
  if not (start in visited) then  //включение приемлемо
  begin  //включение i-го объекта
    LenthPath:=LenthPath + Roads[start,finish];
    Include(visited, start);
  end;
  if (start<>finish) and (start<maxN) then   //если не достигли конца
    FindShortPath(start+1,finish,LenthPath,LenOpt,visited)
  else
    if LenthPath<lenOpt then  //проверка оптимальности
      LenOpt:=LenthPath;
  Exclude(visited, finish);
  LenthPath:=LenthPath - Roads[start,finish];

  if start<maxN then   //приемлемо невключение
    FindShortPath(start+1,finish,LenthPath,LenOpt,visited)
  else
    if LenthPath<lenOpt then  //проверка оптимальности
      LenOpt:=LenthPath;
end;



procedure TForm1.btnResultClick(Sender: TObject);
var i,j, minCity, minRoads, sum:integer;
    len, lenOpt:integer;
    visited: TSet;
begin
  for i:=1 to maxN do
  begin
    MinCitRoads.Cells[i,0]:= IntToStr(i);
    MinCitRoads.Cells[0,i]:= IntToStr(i);
    MinCitRoads.Cells[i,i]:= IntToStr(0);
  end;
  for i:= 1 to maxN do
    for j:= 1 to maxN do
      if i<>j then
      begin
        lenOpt:= StrToInt(Cities.Cells[i,j]);
        len:=0;
        FindShortPath(i,j,len,lenOpt,visited);
        MinCitRoads.Cells[i,j]:=IntToStr(lenOpt);
      end;
  minRoads:=1000;
  for i:=1 to maxN do
    begin
      sum:=0;
      for j:=1 to maxN do
      sum:= sum + StrToInt(MinCitRoads.Cells[i,j]);
      if sum<minRoads then
        begin
          minRoads:= sum;
          minCity:=i;
        end;
    end;
 edtResult.Text:= IntToStr(minCity);

end;

end.

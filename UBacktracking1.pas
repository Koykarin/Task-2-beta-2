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
    TIndex=1..MaxN;
    TMatr=array[TIndex,TIndex]of integer;
    TSet=set of TIndex;
    procedure PrintRoadsClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FillRoads (var R:TMatr);
    procedure PrintRoads (var R:TMatr);

  end;


var
  Form1: TForm1;
  Roads:TMatr;   //������ ����� ��������

implementation

{$R *.dfm}

procedure TForm1.FillRoads (var R:TMatr);
var i, j: integer;
begin
 //�������������
  Randomize;
  for i := 1 to MaxN do
    begin
      R[i,i]:=0;
      for j := i+1 to MaxN do
        begin
          R[i,j]:= random(10) ;
          R[j,i]:= R[i,j];
        end;
    end;
end;

procedure TForm1.PrintRoads (var R:TMatr; var C:TStringGrid);
var i, j: integer;
begin
for i := 1 to MaxN do
    for j:= 1 to maxN do
      C.Cells[i,j]:= R[i,j];
end;


procedure TForm1.FillRoadsClick(Sender: TObject);
begin

end;

end.





var

//  A,B: TIndex;

procedure FillRoads (var R:TMatr);
{���������� �����}
var i, j: integer;
begin
 //�������������
  Randomize;
  for i := 1 to MaxN do
    begin
      R[i,i]:=0;
      for j := i+1 to MaxN do
        begin
          R[i,j]:= random(10) ;
          R[j,i]:= R[i,j];
        end;
    end;
end;

procedure PrintRoads (var R:TMatr);
{���������� �����}
var i, j: integer;
begin
  write('   ');
  for i := 1 to MaxN do
    write(i,' ');
  writeln;
  writeln('--------------------');
  for i := 1 to MaxN do
    begin
      write(i,'| ');
      for j := 1 to MaxN do
        write(ord(R[i,j]),' ');
      writeln;
    end;
end;

procedure PrintRoads (var R:TMatr);
{������ ����}
var i: integer;
begin
  write('����   ');
  for i := 1 to l do
    write(p[i],' ');
  Writeln;
end;

//------------------------------------------------------------------------

//procedure MainAllPath;
///// 2.����� ���� �����
//var v:TSet;
//  procedure FindAllPath(t:TIndex; var visited:TSet);
//  var k: integer;
//  begin
//    for k := 1 to MaxN do
//      begin
//        //����� ������ - k
//        if (Roads[t,k]>0) and not (k in visited) then // k ��������
//          begin
//            len:=len+1;
//            P[len]:=k;  {������� ����� i � ����}
//            Include(visited,k);  {�������� i � ��������� �������, �. ��������}
//
//            //������� �� ������ = �� ����� �� ������ B
//            if k<>B
//            then FindAllPath(k,visited)
//            else PrintPath(P,len);
//
//            //��������� i �� ��������� �������, �. ��������
//            Exclude(visited,k);
//            len:=len-1;
//          end;
//      end;
//  end;
//begin
//  //�������� ���� �� ������ A
//  len:=1;
//  P[len]:=A;
//  v:=[A];
//  FindAllPath(A,v)
//end;

function min(a, b: Integer): Integer;
begin
  min:=a; if b<a then min:=b;
end;

//------------------------------------------------------------------------

var
  i, j, k, V_min, s, ts: integer;

begin
  SetConsoleCp(1251);
  SetConsoleOutPutCp(1251);

  FillRoads(Roads);
  PrintRoads(Roads);
  writeln;
//  writeln('����� ���� �����');
//  MainAllPath;
{ �������� ������-�������� }
  for k:=1 to maxN do
    for i:=1 to maxN do
      for j:=1 to maxN do
        Roads[i,j]:= Min (Roads[i,j], Roads[i,k]+Roads[k,j]);
  { ���� ������� � ����������� ������ }
  for i:=1 to maxN do
  begin
    S:=0;
    for j:=1 to maxN do        
      inc(S,Roads[i,j]);
    if S<TS then
    begin
      TS:=S; V_min:=i;
    end;
  end;

  PrintRoads(Roads);
  writeln;
  WriteLn(V_min); { ����� ������ � ����������� ����������� (��������� � 1)}
  readln;
end.


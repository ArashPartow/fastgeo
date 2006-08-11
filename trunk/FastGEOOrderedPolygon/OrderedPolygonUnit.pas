(*************************************************************************)
(*                                                                       *)
(*                        FastGEO Ordered Polygon                        *)
(*                         Release Version 0.0.1                         *)
(*                                                                       *)
(* Author: Arash Partow 1997-2005                                        *)
(* URL: http://fastgeo.partow.net                                        *)
(*      http://www.partow.net/projects/fastgeo/index.html                *)
(*                                                                       *)
(* Copyright notice:                                                     *)
(* Free use of the FastGEO Ordered Polygon is permitted under the        *)
(* guidelines and in accordance with the most current version of the     *)
(* Common Public License.                                                *)
(* http://www.opensource.org/licenses/cpl.php                            *)
(*                                                                       *)
(* Description:                                                          *)
(* This is a simple implementation of re-ordering a complex              *)
(* 2D/3D self-intersecting polygon into a simple concave polygon using   *)
(* FastGEO as the base for geometric primitives.                         *)
(*                                                                       *)
(*************************************************************************)



unit OrderedPolygonUnit;

interface

uses FastGEO;

type TOrdPolyPoint2D = Record
                        x   : Double;
                        y   : Double;
                        ang : Double;
                       end;

type TOrdPolyPoint3D = Record
                        x   : Double;
                        y   : Double;
                        z   : Double;
                        ang : Double;
                       end;


type TOrderedPolygon2D = class

     private
      Point: Array Of TOrdPolyPoint2D;


     public

      procedure OrderedPolygon(var Pnt: Array Of TPoint2D);

     private

      procedure Swap(I,J:LongInt);
      procedure RQSort(Left,Right:LongInt);
      function  Partition(Left,Right:LongInt):LongInt;

end;



type TOrderedPolygon3D = Class

     private
      Point: Array Of TOrdPolyPoint3D;


     public

      procedure OrderedPolygon(var Pnt: Array Of TPoint3D);

     private

      procedure Swap(I,J:LongInt);
      procedure RQSort(Left,Right:LongInt);
      function  Partition(Left,Right:LongInt):LongInt;

end;


implementation

procedure TOrderedPolygon2D.OrderedPolygon(var Pnt: Array Of TPoint2D);
var
  i        : Integer;
  j        : Integer;
begin
 SetLength(Point,Length(Pnt));

 j := 0;
 for i := 0 to Length(Point) - 1 do
 begin
   Point[i].x   := Pnt[i].x;
   Point[i].y   := Pnt[i].y;
   Point[i].ang := 0.0;

   if Point[i].y < Point[j].y then
     j := i
    else if Point[i].y = Point[j].y then
      if Point[i].x < Point[j].x then
        j := i;
 end;

 Swap(0,j);

 for i := 1 to Length(Point) - 1 do
 begin
   Point[i].ang := CartesianAngle(Point[i].x - Point[0].x, Point[i].y - Point[0].y);
 end;

 RQSort(1,Length(Point) - 1);

 For i := 0 to Length(Point) - 1 do
 begin
   Pnt[i].x := Point[i].x;
   Pnt[i].y := Point[i].y;
 end;

end;

procedure TOrderedPolygon2D.Swap(I,J:LongInt);
var
  Temp : TOrdPolyPoint2D;
begin
 Temp     := Point[I];
 Point[I] := Point[J];
 Point[J] := Temp;
end;


(* Quick sorts main block *)
procedure TOrderedPolygon2D.RQSort(Left,Right:LongInt);
var
  i : Integer;
begin
 (* ends have crossed over pivot *)
 if Right <= Left then
   Exit;

 (* paritition array *)
 i := Partition(Left,Right);

 (*
    apply quick-sort to both left
    and right sides of pivoting
 *)

 RQSort(Left,i-1);
 RQSort(i+1,Right);
end;


(* paritition method for quick-sort *)
function TOrderedPolygon2D.Partition(Left,Right:LongInt):LongInt;
var
  I      : Integer;
  J      : Integer;
  Middle : Integer;
 Pivot   : TOrdPolyPoint2D;
begin
 i      := Left;
 j      := Right;
 Middle := (Left+Right) Div 2;

 { Median of 3 Pivot Selection }
 if Point[Middle].Ang < Point[Left].Ang   then Swap(Left, Middle);
 if Point[Right].Ang  < Point[Middle].Ang then Swap(Right,Middle);
 if Point[Middle].Ang < Point[Left].Ang   then Swap(Left, Middle);

 Pivot.Ang := Point[Right].Ang;

 Repeat

  while (Pivot.Ang >= Point[i].Ang) and (i < Right) Do Inc(i);
  while  Pivot.Ang <= Point[j].Ang Do
   begin
    Dec(j);
    if J-1 < 0 then Break;
   end;
  if i < j then  Swap(i, j);

 Until i >= j;

 Swap(i,Right);
 Result:=i;
end;



procedure TOrderedPolygon3D.OrderedPolygon(var Pnt: Array Of TPoint3D);
var
  I        : Integer;
  LargestX : Double;
  LargestZ : Double;
begin
 SetLength(Point,Length(Pnt));
 LargestX := 0;
 LargestZ := 0;
 for I := 0 to Length(Pnt)-1 do
 begin
   Point[I].x   := Pnt[I].x;
   Point[I].y   := Pnt[I].y;
   Point[I].z   := Pnt[I].z;
   Point[I].ang := 0.0;
   if Point[I].y < Point[0].y then Swap(0,I);
   if Point[I].x > LargestX   then LargestX := Point[i].x;
   if Point[I].z > LargestZ   then LargestZ := Point[i].z;
 end;

 for I:=  1 to Length(Pnt)-1 do
 begin
   Point[I].ang := VertexAngle(LargestX,Point[0].y,LargestZ,Point[0].x,Point[0].y,Point[0].z,Point[i].x,Point[i].y,Point[i].z);
 end;

 RQSort(1,Length(Point)-1);

 for I := 0 to Length(Pnt) - 1 do
 begin
   Pnt[I].x   := Point[I].x;
   Pnt[I].y   := Point[I].y;
   Pnt[I].z   := Point[I].z;
 end;

end;

procedure TOrderedPolygon3D.Swap(I,J:LongInt);
var
  Temp : TOrdPolyPoint3D;
begin
 Temp     := Point[I];
 Point[I] := Point[J];
 Point[J] := Temp;
end;


(* Quick sorts main block *)
procedure TOrderedPolygon3D.RQSort(Left,Right:LongInt);
var
  I:Integer;
begin
 (* ends have crossed over pivot *)
 if Right <= Left then Exit;

 (* paritition array *)
 i := Partition(Left,Right);

 (*
    apply quick-sort to both left
    and right sides of pivoting
 *)

 RQSort(Left,i-1);
 RQSort(i+1,Right);
end;


(* paritition method for quick-sort *)
function TOrderedPolygon3D.Partition(Left,Right:LongInt):LongInt;
var
  I      : Longint;
  J      : Longint;
  Middle : LongInt;
  Pivot  : TOrdPolyPoint3D;
begin
 i      := Left;
 j      := Right;
 Middle := (Left+Right) Div 2;

 { Median of 3 Pivot Selection }
 if Point[Middle].Ang < Point[Left].Ang   then Swap(Left, Middle);
 if Point[Right].Ang  < Point[Middle].Ang then Swap(Right,Middle);
 if Point[Middle].Ang < Point[Left].Ang   then Swap(Left, Middle);

 Pivot.Ang := Point[Right].Ang;

 repeat

  while (Pivot.Ang >= Point[i].Ang) and (i < Right) Do Inc(i);
  while  Pivot.Ang <= Point[j].Ang Do
  begin
    Dec(j);
    if J-1 < 0 then Break;
  end;
  if i < j then  Swap(i, j);

 until i >= j;

 Swap(i,Right);
 Result:=i;
end;




end.

(*************************************************************************)
(*                                                                       *)
(*                  FastGEO Demonstration Suite                          *)
(* File: FGDS_Intersections                                              *)
(* Purpose: Intersections related routines                               *)
(*                                                                       *)
(* Author: Arash Partow 1997-2006                                        *)
(* URL: http://fastgeo.partow.net                                        *)
(*      http://www.partow.net/projects/fastgeo/index.html                *)
(*                                                                       *)
(* Copyright notice:                                                     *)
(* Free use of the FastGEO Demonstration Suite is permitted under the    *)
(* guidelines and in accordance with the most current version of the     *)
(* Common Public License.                                                *)
(* http://www.opensource.org/licenses/cpl.php                            *)
(*                                                                       *)
(*************************************************************************)


unit FGDS_Intersections;

interface

uses
   Graphics,
   Classes,
   FastGEO,
   FastGEOGraphics;

procedure SegmentIntersect00(const Graphic : TFastGEOGraphics);
procedure SegmentIntersect01(const Graphic : TFastGEOGraphics);

procedure CircleIntersect00(const Graphic : TFastGEOGraphics);
procedure CircleIntersect01(const Graphic : TFastGEOGraphics);

implementation

procedure SegmentIntersect00(const Graphic : TFastGEOGraphics);
var
  i       : Integer;
  j       : Integer;
  ix      : Double;
  iy      : Double;
  Segment : array [1..8] of TSegment2D;
  Point   : TPoint2D;
begin
 Graphic.Clear(clWhite);

 Segment[1] := EquateSegment(100,100,300,300);
 Segment[2] := EquateSegment(300,100,100,300);

 Segment[3] := EquateSegment(400,300,550,100);
 Segment[4] := EquateSegment(700,300,550,100);

 Segment[5] := EquateSegment(100,350,300,350);
 Segment[6] := EquateSegment(300,350,500,350);

 Segment[7] := EquateSegment(100,50,600,50);
 Segment[8] := EquateSegment(350,50,350,200);

 for i := 1 to 8 do
 begin
  Graphic.DrawSegment(Segment[i]);
 end;

 for i := 1 to 8 do
 begin
  for j := i + 1 to 8 do
  begin
   if SimpleIntersect(Segment[i],Segment[j]) then
   begin

    Intersect(Segment[i],Segment[j],ix,iy);
    Graphic.DrawCircle(ix,iy,5);

    Point := IntersectionPoint(Segment[i],Segment[j]);
    Graphic.DrawCircle(Point,10);

   end;
  end;
 end;

end;


procedure SegmentIntersect01(Const Graphic : TFastGEOGraphics);
const MAX_SEGMENTS = 100;
var
  i       : Integer;
  j       : Integer;
  ix      : Double;
  iy      : Double;
  Segment : array of TSegment2D;
begin
 Graphic.Clear(clWhite);

 SetLength(Segment,MAX_SEGMENTS);

 try

  Randomize;
  for i := 0 to Length(Segment) - 1 do
  begin
   Segment[i][1].x := Random(Graphic.Width  - 10) + 5;
   Segment[i][1].y := Random(Graphic.Height - 10) + 5;
   Segment[i][2].x := Random(Graphic.Width  - 10) + 5;
   Segment[i][2].y := Random(Graphic.Height - 10) + 5;
   Graphic.DrawSegment(Segment[i]);
  end;

  Graphic.Pen.Color := clRed;

  for i := 0 to Length(Segment) - 1 do
  begin
   for j := (i + 1) to Length(Segment) - 1 do
    if Intersect(Segment[i],Segment[j],ix,iy) then
    begin
     Graphic.DrawCircle(ix,iy,4);
    end;
  end;

  Graphic.Pen.Color := clBlack;

 finally
  Finalize(Segment);
 end;
end;


procedure CircleIntersect00(const Graphic : TFastGEOGraphics);
const MAX_CIRCLES  = 100;
var
  i       : Integer;
  j       : Integer;
  Circle  : array of TCircle;
  IPnt1   : TPoint2D;
  IPnt2   : TPoint2D;
begin
 Graphic.Clear(clWhite);

 SetLength(Circle,MAX_CIRCLES);

 try

  Randomize;

  for i:= 1 to Length(Circle) - 1 do
  begin
   Circle[i].Radius := Random(50) + 20;
   Circle[i].x      := Random(Graphic.Width  - (Round(Circle[i].Radius) * 2)) + Circle[i].Radius;
   Circle[i].y      := Random(Graphic.Height - (Round(Circle[i].Radius) * 2)) + Circle[i].Radius;
   Graphic.DrawCircle(Circle[i]);
  end;

  Graphic.Pen.Color := clRed;

  for i := 0 to Length(Circle) - 1 do
  begin
   for j := (i + 1) to Length(Circle) - 1 do
    if Intersect(Circle[i],Circle[j]) and
      (Distance(Circle[i].x,Circle[i].y,Circle[j].x,Circle[j].y) >= abs(Circle[i].Radius - Circle[j].Radius)) then
    begin
     IntersectionPoint(Circle[i],Circle[j],IPnt1,IPnt2);
     Graphic.DrawCircle(IPnt1,5);
     Graphic.DrawCircle(IPnt2,5);
    end;
  end;

  Graphic.Pen.Color := clBlack;

 finally
  Finalize(Circle);
 end;

end;


procedure CircleIntersect01(const Graphic : TFastGEOGraphics);
const MAX_SEGMENTS = 50;
const MAX_CIRCLES  = 20;
var
  i       : Integer;
  Segment : array of TSegment2D;
  Circle  : array of TCircle;
begin
 Graphic.Clear(clWhite);

 SetLength(Segment,MAX_SEGMENTS);
 SetLength(Circle,MAX_CIRCLES);

 try

  Randomize;

  for i:= 1 to Length(Segment) - 1 do
  begin
   Segment[i][1].x := Random(Graphic.Width);
   Segment[i][1].y := Random(Graphic.Height);
   Segment[i][2].x := Random(Graphic.Width);
   Segment[i][2].y := Random(Graphic.Height);
   Graphic.DrawSegment(Segment[i]);
  end;

  for i:= 1 to Length(Circle) - 1 do
  begin
   Circle[i].Radius := Random(50) + 20;
   Circle[i].x      := Random(Graphic.Width  - Round(Circle[i].Radius / 2)) + (Circle[i].Radius / 2);
   Circle[i].y      := Random(Graphic.Height - Round(Circle[i].Radius / 2)) + (Circle[i].Radius / 2);
   Graphic.DrawCircle(Circle[i]);
  end;

 finally
  Finalize(Segment);
  Finalize(Circle);
 end;

end;

end.

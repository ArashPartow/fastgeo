(*************************************************************************)
(*                                                                       *)
(*                  FastGEO Demonstration Suite                          *)
(* File: FGDS_Randomize                                                  *)
(* Purpose: Triangle related routines                                    *)
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


unit FGDS_Randomize;


interface

uses
   Forms,
   SysUtils,
   Graphics,
   Classes,
   Dialogs,
   FastGEO,
   FastGEOGraphics;

const MAX_POINTS = 1000;

procedure RandomPointsAABB    (const Graphic : TFastGEOGraphics);
procedure RandomPointsTriangle(const Graphic : TFastGEOGraphics);
procedure RandomPointsCircle  (const Graphic : TFastGEOGraphics);
procedure RandomPointsQuadix  (const Graphic : TFastGEOGraphics);

implementation

procedure RandomPointsAABB(const Graphic : TFastGEOGraphics);
var
  i         : Integer;
  Rectangle : TRectangle;
  Point     : array of TPoint2D;
begin
 Randomize;
 Graphic.Clear(clWhite);
 Rectangle[1].x := Random(Graphic.Width  - 305) + 5.0;
 Rectangle[1].y := Random(Graphic.Height - 305) + 5.0;
 Rectangle[2].x := Rectangle[1].x + Random(300) + 100.0;
 Rectangle[2].y := Rectangle[1].y + Random(300) + 100.0;
 Graphic.Draw(Rectangle);
 SetLength(Point,MAX_POINTS);
 GenerateRandomPoints(Rectangle,Point);
 Graphic.Pen.Color   := clBlack;

 for i := 0 to Length(Point) - 1 do
 begin
  if PointInRectangle(Point[i],Rectangle) then
    Graphic.Draw(Point[i])
  else
    MessageDlg('Point has been generated outside of AABB! ' + Format('Rectangle(%9.5f,%9.5f,%9.5f,%9.5f) Point(%9.5f,%9.5f) ',[Rectangle[1].x,Rectangle[1].y,
                                                                                                                               Rectangle[1].x,Rectangle[1].y,
                                                                                                                               Point[i].x    ,Point[i].y]), mtError,[mbOk], 0);
 end;

 finalize(Point);
end;


procedure RandomPointsTriangle(const Graphic : TFastGEOGraphics);
var
  i        : Integer;
  Triangle : TTriangle2D;
  Point    : array of TPoint2D;
begin
 Randomize;
 Graphic.Clear(clWhite);
 GenerateRandomTriangle(0.0,0.0,Graphic.Width,Graphic.Height,Triangle);
 Graphic.Draw(Triangle);
 SetLength(Point,MAX_POINTS);
 GenerateRandomPoints(Triangle,Point);
 Graphic.Pen.Color   := clBlack;

 for i := 0 to Length(Point) - 1 do
 begin
  if PointInTriangle(Point[i],Triangle) then
    Graphic.Draw(Point[i])
  else
    MessageDlg('Point has been generated outside of Triangle! ' + Format('Triangle(%9.5f,%9.5f,%9.5f,%9.5f,%9.5f,%9.5f) Point(%9.5f,%9.5f) ',[Triangle[1].x,Triangle[1].y,
                                                                                                                                              Triangle[2].x,Triangle[2].y,
                                                                                                                                              Triangle[3].x,Triangle[3].y,
                                                                                                                                              Point[i].x   ,Point[i].y]), mtError,[mbOk], 0);
 end;
 finalize(Point);
end;


procedure RandomPointsCircle(const Graphic : TFastGEOGraphics);
var
  i      : Integer;
  Circle : TCircle;
  Point  : array of TPoint2D;
begin
 Randomize;
 Graphic.Clear(clWhite);
 GenerateRandomCircle(0.0,0.0,Graphic.Width,Graphic.Height,Circle);
 Graphic.Draw(Circle);
 SetLength(Point,MAX_POINTS);
 GenerateRandomPoints(Circle,Point);

 Graphic.Pen.Color   := clBlack;

 for i := 0 to Length(Point) - 1 do
 begin
  if PointInCircle(Point[i],Circle) then
    Graphic.Draw(Point[i])
  else
    MessageDlg('Point has been generated outside of Circle! ' + Format('Circle(%9.5f,%9.5f,%9.5f) Point(%9.5f,%9.5f)',[Circle.x,Circle.y,Circle.Radius,
                                                                                                                       Point[i].x   ,Point[i].y]), mtError,[mbOk], 0);
 end;
 finalize(Point);
end;


procedure RandomPointsQuadix(const Graphic : TFastGEOGraphics);
var
  i      : Integer;
  Quadix : TQuadix2D;
  Point  : array of TPoint2D;
begin
 Randomize;
 Graphic.Clear(clWhite);
 GenerateRandomQuadix(0.0,0.0,Graphic.Width,Graphic.Height,Quadix);
 Graphic.Draw(Quadix);
 SetLength(Point,MAX_POINTS);
 GenerateRandomPoints(Quadix,Point);
 Graphic.Pen.Color := clBlack;

 for i := 0 to Length(Point) - 1 do
 begin
  if PointInQuadix(Point[i],Quadix) then
    Graphic.Draw(Point[i])
  else
    MessageDlg('Point has been generated outside of Quadix! ' + Format('Quadix(%9.5f,%9.5f,%9.5f,%9.5f,%9.5f,%9.5f,%9.5f,%9.5f) Point(%9.5f,%9.5f) ',[Quadix[1].x,Quadix[1].y,
                                                                                                                                                      Quadix[2].x,Quadix[2].y,
                                                                                                                                                      Quadix[3].x,Quadix[3].y,
                                                                                                                                                      Quadix[4].x,Quadix[4].y,
                                                                                                                                                      Point[i].x ,Point[i].y]), mtError,[mbOk], 0);
 end;
 finalize(Point);
End;


end.

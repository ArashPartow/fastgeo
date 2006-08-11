(*************************************************************************)
(*                                                                       *)
(*                  FastGEO Demonstration Suite                          *)
(* File: FGDS_Triangles                                                  *)
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


unit FGDS_Triangles;

interface

uses
   Forms,
   SysUtils,
   Graphics,
   Classes,
   FastGEO,
   FastGEOGraphics;


procedure GenerateRandomTriangles(const W,H:Integer; Var Triangle : Array Of TTriangle2D);
procedure TriangleCircumcircle   (const Graphic : TFastGEOGraphics);
procedure TriangleInscribedCircle(const Graphic : TFastGEOGraphics);
procedure TriangleTorricelliPoint(const Graphic : TFastGEOGraphics);


implementation


procedure GenerateRandomTriangles(const W,H:Integer; var Triangle : array of TTriangle2D);
var
  i : Integer;
begin
 for i := 0 to Length(Triangle) - 1 do
 begin
  if (i Mod 3) = 0 then
  begin
   Triangle[i][1].x := Random(W - 10) + 5.0;
   Triangle[i][1].y := Random(H - 10) + 5.0;
   Triangle[i][2].x := Triangle[i][1].x + Random(200);
   Triangle[i][2].y := Triangle[i][1].y - Random(200);
   CreateEquilateralTriangle(Triangle[i][1],Triangle[i][2],Triangle[i][3]);
  end
  else

  repeat

   Triangle[i][1].x := Random(W - 10) + 5.0;
   Triangle[i][1].y := Random(H - 10) + 5.0;

   Triangle[i][2].x := Triangle[i][1].x + Random(300) + 50;
   Triangle[i][2].y := Triangle[i][1].y + Random(200) + 50;

   Triangle[i][3].x := Triangle[i][1].x - Random(200) + 50;
   Triangle[i][3].y := Triangle[i][1].y - Random(300) + 50;

  until not IsDegenerate(Triangle[i]);

 end;
end;


procedure TriangleCircumcircle(const Graphic : TFastGEOGraphics);
const MAX_TRIANLGES = 30;
var
  i        : Integer;
  Triangle : array Of TTriangle2D;
begin
 Randomize;

 Graphic.Clear(clWhite);

 SetLength(Triangle,MAX_TRIANLGES);
 GenerateRandomTriangles(Graphic.Width,Graphic.Height,Triangle);

 for i := 0 To MAX_TRIANLGES - 1 do
 begin
  Graphic.Draw(Triangle[i]);
  Graphic.Pen.Color := clLime;
  Graphic.Draw(Circumcircle(Triangle[i]));
  Graphic.Pen.Color := clBlack;
 end;

 finalize(Triangle);
end;


procedure TriangleInscribedCircle(const Graphic : TFastGEOGraphics);
const MAX_TRIANLGES = 30;
var
  i        : Integer;
  Triangle : array Of TTriangle2D;
begin
 Randomize;

 Graphic.Clear(clWhite);

 SetLength(Triangle,MAX_TRIANLGES);

 GenerateRandomTriangles(Graphic.Width,Graphic.Height,Triangle);

 for i := 0 To MAX_TRIANLGES - 1 do
 begin
  Graphic.Draw(Triangle[i]);
  Graphic.Pen.Color := clLime;
  Graphic.Draw(InscribedCircle(Triangle[i]));
  Graphic.Pen.Color := clBlack;
 end;

 finalize(Triangle);
end;


procedure TriangleTorricelliPoint(const Graphic : TFastGEOGraphics);
const MAX_TRIANLGES = 30;
var
  i        : Integer;
  Triangle : array Of TTriangle2D;
  TorPnt   : TPoint2D;
begin
 Randomize;

 Graphic.Clear(clWhite);

 SetLength(Triangle,MAX_TRIANLGES);

 GenerateRandomTriangles(Graphic.Width,Graphic.Height,Triangle);

 for i := 0 To MAX_TRIANLGES - 1 do
 begin
  Graphic.Draw(Triangle[i]);
  Graphic.Pen.Color := clLime;
  TorPnt := TorricelliPoint(Triangle[i]);
  Graphic.DrawCircle(TorPnt,5);
  Graphic.Pen.Color := clBlack;
  Graphic.DrawSegment(TorPnt,Triangle[i][1]);
  Graphic.DrawSegment(TorPnt,Triangle[i][2]);
  Graphic.DrawSegment(TorPnt,Triangle[i][3]);
 end;

 finalize(Triangle);
end;

end.

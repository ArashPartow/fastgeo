(*************************************************************************)
(*                                                                       *)
(*                  FastGEO Demonstration Suite                          *)
(* File: FGDS_Clipping                                                   *)
(* Purpose: Clipping related routines                                    *)
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


unit FGDS_Clipping;

interface

uses
   Windows,
   Forms,
   SysUtils,
   Graphics,
   Classes,
   FastGEOSerializer,
   FastGEO,
   FastGEOGraphics;

procedure SegmentTriangleClip   (const Graphic : TFastGEOGraphics);
procedure SegmentQuadixClip     (const Graphic : TFastGEOGraphics);
procedure SegmentRectangleClip  (const Graphic : TFastGEOGraphics);
procedure SegmentCircleClip     (const Graphic : TFastGEOGraphics);
procedure RectangleRectangleClip(const Graphic : TFastGEOGraphics);

implementation

procedure SegmentTriangleClip(const Graphic : TFastGEOGraphics);
const MAX_SEGMENTS = 50;
var
  i          : Integer;
  Triangle   : TTriangle2D;
  ClippedSeg : TSegment2D;
  Segment    : array of TSegment2D;
begin
  Randomize;

  Graphic.Clear(clWhite);

  repeat
    Triangle[1].x := Random(Graphic.Width  - 10) + 5.0;
    Triangle[1].y := Random(Graphic.Height - 10) + 5.0;

    Triangle[2].y := Random(Graphic.Height - 10) + 5.0;
    Triangle[2].x := Random(Graphic.Width  - 10) + 5.0;

    Triangle[3].y := Random(Graphic.Height - 10) + 5.0;
    Triangle[3].x := Random(Graphic.Width  - 10) + 5.0;
  until not IsDegenerate(Triangle);

  Graphic.Pen.Width := 3;
  Graphic.Draw(Triangle);
  Graphic.Pen.Width := 1;

  SetLength(Segment,MAX_SEGMENTS);

  for i := 0 to MAX_SEGMENTS - 1 do
  begin
    repeat
      Segment[i][1].x := Random(Graphic.Width  - 10) + 5.0;
      Segment[i][1].y := Random(Graphic.Height - 10) + 5.0;
      Segment[i][2].x := Random(Graphic.Width  - 10) + 5.0;
      Segment[i][2].y := Random(Graphic.Height - 10) + 5.0;
    until not IsDegenerate(Segment[i]);

    Graphic.Draw(Segment[i]);

    if Clip(Segment[i],Triangle,ClippedSeg) then
    begin
      Graphic.Pen.Color := clLime;
      Graphic.Draw(ClippedSeg);
      Graphic.Pen.Color := clRed;
      Graphic.DrawCircle(ClippedSeg[1],3);
      Graphic.DrawCircle(ClippedSeg[2],3);
      Graphic.Pen.Color := clBlack;
    end;
  end;
  finalize(Segment);
end;

procedure SegmentQuadixClip(const Graphic : TFastGEOGraphics);
const MAX_SEGMENTS = 50;
var
  i          : Integer;
  Quadix     : TQuadix2D;
  ClippedSeg : TSegment2D;
  Segment    : array of TSegment2D;
begin
  Randomize;
  Graphic.Clear(clWhite);
  repeat
    Quadix[1].x := Random(Graphic.Width  - 10) + 5.0;
    Quadix[1].y := Random(Graphic.Height - 10) + 5.0;
    Quadix[2].y := Random(Graphic.Height - 10) + 5.0;
    Quadix[2].x := Random(Graphic.Width  - 10) + 5.0;
    Quadix[3].y := Random(Graphic.Height - 10) + 5.0;
    Quadix[3].x := Random(Graphic.Width  - 10) + 5.0;
    Quadix[4].y := Random(Graphic.Height - 10) + 5.0;
    Quadix[4].x := Random(Graphic.Width  - 10) + 5.0;
  until (not IsDegenerate(Quadix)) and ConvexQuadix(Quadix);

  Graphic.Pen.Width := 3;
  Graphic.Draw(Quadix);
  Graphic.Pen.Width := 1;

  SetLength(Segment,MAX_SEGMENTS);

  for i := 0 to MAX_SEGMENTS - 1 do
  begin
    repeat
      Segment[i][1].x := Random(Graphic.Width  - 10) + 5.0;
      Segment[i][1].y := Random(Graphic.Height - 10) + 5.0;
      Segment[i][2].x := Random(Graphic.Width  - 10) + 5.0;
      Segment[i][2].y := Random(Graphic.Height - 10) + 5.0;
    until not IsDegenerate(Segment[i]);

    Graphic.Draw(Segment[i]);

    if Clip(Segment[i],Quadix,ClippedSeg) then
    begin
      Graphic.Pen.Color := clLime;
      Graphic.Draw(ClippedSeg);
      Graphic.Pen.Color := clRed;
      Graphic.DrawCircle(ClippedSeg[1],3);
      Graphic.DrawCircle(ClippedSeg[2],3);
      Graphic.Pen.Color := clBlack;
    end;
  end;
  finalize(Segment);
end;

procedure SegmentRectangleClip(Const Graphic : TFastGEOGraphics);
const MAX_SEGMENTS = 60;
var
  i          : Integer;
  Rectangle  : TRectangle;
  ClippedSeg : TSegment2D;
  Segment    : array of TSegment2D;
  Temp       : Double;
begin
  Randomize;
  Graphic.Clear(clWhite);

  repeat
    Rectangle[1].x := Random(Graphic.Width  - 10) + 5.0;
    Rectangle[1].y := Random(Graphic.Height - 10) + 5.0;

    Rectangle[2].y := Random(Graphic.Height - 10) + 5.0;
    Rectangle[2].x := Random(Graphic.Width  - 10) + 5.0;

    if Rectangle[1].x > Rectangle[2].x then
    begin
      Temp := Rectangle[2].x;
      Rectangle[2].x := Rectangle[1].x;
      Rectangle[1].x := Temp;
    end;

    if Rectangle[1].y > Rectangle[2].y then
    begin
      Temp := Rectangle[2].y;
      Rectangle[2].y := Rectangle[1].y;
      Rectangle[1].y := Temp;
    end;
  until not IsDegenerate(Rectangle);



  Graphic.Pen.Width := 3;
  Graphic.Draw(Rectangle);
  Graphic.Pen.Width := 1;

  SetLength(Segment,MAX_SEGMENTS);

  for i := 0 to MAX_SEGMENTS - 1 do
  begin
    repeat
      Segment[i][1].x := Random(Graphic.Width  - 10) + 5.0;
      Segment[i][1].y := Random(Graphic.Height - 10) + 5.0;
      Segment[i][2].x := Random(Graphic.Width  - 10) + 5.0;
      Segment[i][2].y := Random(Graphic.Height - 10) + 5.0;
    until not IsDegenerate(Segment[i]);

    Graphic.Draw(Segment[i]);

    if Clip(Segment[i],Rectangle,ClippedSeg) then
    begin
      Graphic.Pen.Color := clLime;
      Graphic.DrawSegment(ClippedSeg);
      Graphic.Pen.Color := clRed;
      Graphic.DrawCircle(ClippedSeg[1],3);
      Graphic.DrawCircle(ClippedSeg[2],3);
      Graphic.Pen.Color := clBlack;
    end;
  end;
  finalize(Segment);
end;


procedure SegmentCircleClip(Const Graphic : TFastGEOGraphics);

const MAX_SEGMENTS = 60;

var
  i          : Integer;
  Circle     : TCircle;
  ClippedSeg : TSegment2D;
  Segment    : array of TSegment2D;
begin
  Randomize;
  Graphic.Clear(clWhite);

  Circle.Radius := Random(150) + 60;
  Circle.x      := Random(Graphic.Width  - (Round(Circle.Radius) * 2)) + Circle.Radius;
  Circle.y      := Random(Graphic.Height - (Round(Circle.Radius) * 2)) + Circle.Radius;

  Graphic.Pen.Width := 3;
  Graphic.Draw(Circle);
  Graphic.Pen.Width := 1;

  SetLength(Segment,MAX_SEGMENTS);

  for i := 0 to MAX_SEGMENTS - 1 do
  begin
    repeat
      Segment[i][1].x := Random(Graphic.Width  - 10) + 5.0;
      Segment[i][1].y := Random(Graphic.Height - 10) + 5.0;
      Segment[i][2].x := Random(Graphic.Width  - 10) + 5.0;
      Segment[i][2].y := Random(Graphic.Height - 10) + 5.0;
    until not IsDegenerate(Segment[i]);

    Graphic.Draw(Segment[i]);

    Clip(Segment[i],Circle, ClippedSeg);

    if Clip(Segment[i],Circle,ClippedSeg) then
    begin
      Graphic.Pen.Color := clLime;
      Graphic.DrawSegment(ClippedSeg);
      Graphic.Pen.Color := clRed;
      Graphic.DrawCircle(ClippedSeg[1],3);
      Graphic.DrawCircle(ClippedSeg[2],3);
      Graphic.Pen.Color := clBlack;
    end;
  end;
  finalize(Segment);
end;


procedure RectangleRectangleClip(Const Graphic : TFastGEOGraphics);
const MAX_RECTANGLES = 100;

var
  i           : Integer;
  MRect       : TRectangle;
  ClippedRect : TRectangle;
  Rect        : array of TRectangle;
begin
  Randomize;
  Graphic.Clear(clWhite);

  MRect[1].x := Random(Graphic.Width  - 305) + 5.0;
  MRect[1].y := Random(Graphic.Height - 305) + 5.0;
  MRect[2].x := MRect[1].x + Random(300) + 100.0;
  MRect[2].y := MRect[1].y + Random(300) + 100.0;

  Graphic.Pen.Width := 3;
  Graphic.Draw(MRect);
  Graphic.Pen.Width := 1;

  SetLength(Rect,MAX_RECTANGLES);

  for i := 0 to MAX_RECTANGLES - 1 do
  begin
    repeat
      Rect[i][1].x := Random(Graphic.Width  - 305) + 5.0;
      Rect[i][1].y := Random(Graphic.Height - 305) + 5.0;
      Rect[i][2].x := Rect[i][1].x + Random(300) + 100.0;
      Rect[i][2].y := Rect[i][1].y + Random(300) + 100.0;
    until not IsDegenerate(Rect[i]);

    Graphic.Draw(Rect[i]);

    if Clip(Rect[i],MRect,ClippedRect) then
    begin
      Graphic.Pen.Color := clLime;
      Graphic.Draw(ClippedRect);
      Graphic.Pen.Color := clRed;
      Graphic.DrawCircle(ClippedRect[1].x,ClippedRect[1].y,3);
      Graphic.DrawCircle(ClippedRect[2].x,ClippedRect[1].y,3);
      Graphic.DrawCircle(ClippedRect[2].x,ClippedRect[2].y,3);
      Graphic.DrawCircle(ClippedRect[1].x,ClippedRect[2].y,3);
     Graphic.Pen.Color := clBlack;
    end;
  end;
  finalize(Rect);
end;


end.

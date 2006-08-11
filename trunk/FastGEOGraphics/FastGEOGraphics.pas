(*************************************************************************)
(*                                                                       *)
(*                       FastGEO Graphical Interface                     *)
(*                         Release Version 0.0.1                         *)
(*                                                                       *)
(* Author: Arash Partow 1997-2006                                        *)
(* URL: http://fastgeo.partow.net                                        *)
(*      http://www.partow.net/projects/fastgeo/index.html                *)
(*                                                                       *)
(* Copyright notice:                                                     *)
(*                                                                       *)
(* Free use of the FastGEO Graphical Interface library is permitted      *)
(* under the guidelines and in accordance with the most current version  *)
(* of the Common Public License.                                         *)
(* http://www.opensource.org/licenses/cpl.php                            *)
(*                                                                       *)
(* Description:                                                          *)
(* This is a simple interface into the Delphi graphical interface for    *)
(* FastGEO based objects and primitives.                                 *)
(*************************************************************************)


unit FastGEOGraphics;

Interface

uses
   Graphics,
   Classes,
   FastGEO;


type TFastGEOGraphics = class

    private

       Canvas  : TCanvas;
       FWidth  : Integer;
       FHeight : Integer;

       procedure SetWidth(const cWidth : Integer);
       function  GetWidth : Integer;

       procedure SetHeight(const cHeight : Integer);
       function  GetHeight : Integer;

       procedure SetPen(const cPen : TPen);
       function  GetPen : TPen;

       procedure SetBrush(const cBrush : TBrush);
       function  GetBrush : TBrush;

       function  GetCenterX : Double;
       function  GetCenterY : Double;

    public

       constructor Create(const Can : TCanvas);                                 overload;
       constructor Create(const Can : TCanvas; const cWidth,cHeight:Integer);   overload;

       procedure Clear(const Color:TColor);

       procedure Draw(const Point     : TPoint2D);                              overload;
       procedure Draw(const Line      : TLine2D);                               overload;
       procedure Draw(const Segment   : TSegment2D);                            overload;
       procedure Draw(const Triangle  : TTriangle2D);                           overload;
       procedure Draw(const Rectangle : TRectangle);                            overload;
       procedure Draw(const Quadix    : TQuadix2D);                             overload;
       procedure Draw(const Circle    : TCircle);                               overload;
       procedure Draw(const Polygon   : TPolygon2D);                            overload;
       procedure Draw(const Curve     : TPoint2DArray);                         overload;
       procedure Draw(const Obj       : TGeometricObject);                      overload;

       procedure DrawPixel(const x,y:Double);                                   overload;
       procedure DrawPixel(const Point : TPoint2D);                             overload;

       procedure DrawPoint(const x,y:Double);                                   overload;
       procedure DrawPoint(const Point : TPoint2D);                             overload;

       procedure DrawLine(const x1,y1,x2,y2:Double);                            overload;
       procedure DrawLine(const Point1,Point2:TPoint2D);                        overload;
       procedure DrawLine(const Line : TLine2D);                                overload;

       procedure DrawSegment(const x1,y1,x2,y2:Double);                         overload;
       procedure DrawSegment(const Point1,Point2:TPoint2D);                     overload;
       procedure DrawSegment(const Seg:TSegment2D);                             overload;

       procedure DrawTriangle(const x1,y1,x2,y2,x3,y3:Double);                  overload;
       procedure DrawTriangle(const Point1,Point2,Pnt3:TPoint2D);               overload;
       procedure DrawTriangle(const Triangle : TTriangle2D);                    overload;

       procedure DrawRectangle(const x1,y1,x2,y2:Double);                       overload;
       procedure DrawRectangle(const Point1,Point2:TPoint2D);                   overload;
       procedure DrawRectangle(const Rectangle : TRectangle);                   overload;

       procedure DrawQuadix(const x1,y1,x2,y2,x3,y3,x4,y4:Double);              overload;
       procedure DrawQuadix(const Point1,Point2,Pnt3,Pnt4:TPoint2D);            overload;
       procedure DrawQuadix(const Quad:TQuadix2D);                              overload;

       procedure DrawCircle(const x,y,Radius:Double);                           overload;
       procedure DrawCircle(const Point : TPoint2D; const Radius:Double);       overload;
       procedure DrawCircle(const Circle :TCircle);                             overload;

       procedure DrawEllipse(const x,y,a,b:Double);                             overload;


       procedure DrawPolygon(const Point:array of TPoint2D);                    overload;
       procedure DrawPolygon(const Polygon:TPolygon2D);                         overload;

       procedure DrawCurve(Const Curve : TPoint2DArray);

       property  Width   : Integer read GetWidth  write SetWidth;
       property  Height  : Integer read GetHeight write SetHeight;
       Property  CenterX : Double  read GetCenterX;
       Property  CenterY : Double  read GetCenterY;
       property  Pen     : TPen    read GetPen    write SetPen;
       property  Brush   : TBrush  read GetBrush  write SetBrush;
end;




type TFastGEOCartesianGraphics = class

    private

      FGraphicsContext : TFastGEOGraphics;

      function ConvertXCoordinate(const x:TFloat):TFloat;
      function ConvertYCoordinate(const y:TFloat):TFloat;
      function ConvertPolygon(const Polygon: TPolygon2D): TPolygon2D;

    public

       constructor Create(GraphicsContext : TFastGEOGraphics);

       procedure Clear(const Color:TColor);

       procedure Draw(const Point     : TPoint2D);                              overload;
       procedure Draw(const Line      : TLine2D);                               overload;
       procedure Draw(const Segment   : TSegment2D);                            overload;
       procedure Draw(const Triangle  : TTriangle2D);                           overload;
       procedure Draw(const Rectangle : TRectangle);                            overload;
       procedure Draw(const Quadix    : TQuadix2D);                             overload;
       procedure Draw(const Circle    : TCircle);                               overload;
       procedure Draw(const Polygon   : TPolygon2D);                            overload;
       procedure Draw(const Curve     : TPoint2DArray);                         overload;
       procedure Draw(const Obj       : TGeometricObject);                      overload;

       procedure DrawPixel(const x,y:Double);                                   overload;
       procedure DrawPixel(const Point : TPoint2D);                             overload;

       procedure DrawPoint(const x,y:Double);                                   overload;
       procedure DrawPoint(const Point : TPoint2D);                             overload;

       procedure DrawLine(const x1,y1,x2,y2:Double);                            overload;
       procedure DrawLine(const Point1,Point2:TPoint2D);                        overload;
       procedure DrawLine(const Line : TLine2D);                                overload;

       procedure DrawSegment(const x1,y1,x2,y2:Double);                         overload;
       procedure DrawSegment(const Point1,Point2:TPoint2D);                     overload;
       procedure DrawSegment(const Seg:TSegment2D);                             overload;

       procedure DrawTriangle(const x1,y1,x2,y2,x3,y3:Double);                  overload;
       procedure DrawTriangle(const Point1,Point2,Pnt3:TPoint2D);               overload;
       procedure DrawTriangle(const Triangle : TTriangle2D);                    overload;

       procedure DrawRectangle(const x1,y1,x2,y2:Double);                       overload;
       procedure DrawRectangle(const Point1,Point2:TPoint2D);                   overload;
       procedure DrawRectangle(const Rectangle : TRectangle);                   overload;

       procedure DrawQuadix(const x1,y1,x2,y2,x3,y3,x4,y4:Double);              overload;
       procedure DrawQuadix(const Point1,Point2,Pnt3,Pnt4:TPoint2D);            overload;
       procedure DrawQuadix(const Quad:TQuadix2D);                              overload;

       procedure DrawCircle(const x,y,Radius:Double);                           overload;
       procedure DrawCircle(const Point : TPoint2D; const Radius:Double);       overload;
       procedure DrawCircle(const Circle:TCircle);                              overload;

       procedure DrawEllipse(const x,y,a,b:Double);                             overload;


       procedure DrawPolygon(const Point:array of TPoint2D);                    overload;
       procedure DrawPolygon(const Polygon:TPolygon2D);                         overload;

       procedure DrawCurve(Const Curve : TPoint2DArray);

end;

Implementation

constructor TFastGEOGraphics.Create(const Can:TCanvas);
begin
  Canvas := Can;
  Width  := 0;
  Height := 0;
end;
(* End Of Create *)


constructor TFastGEOGraphics.Create(const Can:TCanvas; const cWidth,cHeight:Integer);
begin
  Canvas := Can;
  Width  := cWidth;
  Height := cHeight;
end;
(* End Of Create *)


procedure TFastGEOGraphics.SetWidth(const cWidth : Integer);
begin
  FWidth := cWidth;
end;
(* End Of Set Width *)

function TFastGEOGraphics.GetWidth : Integer;
begin
 Result := FWidth;
end;
(* End Of Get Width *)


procedure TFastGEOGraphics.SetHeight(const cHeight : Integer);
begin
  FHeight := cHeight;
end;
(* End Of Set Height*)


function TFastGEOGraphics.GetHeight : Integer;
begin
  Result := FHeight;
end;
(* End Of Get Height *)


procedure TFastGEOGraphics.Clear(const Color:TColor);
var
  TmpBrushColor : TColor;
  TmpBrushStyle : TBrushStyle;
begin
  TmpBrushColor := Canvas.Brush.Color;
  TmpBrushStyle := Canvas.Brush.Style;

  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := Color;
  Canvas.FillRect(Rect(0,0,Width,Height));

  Canvas.Brush.Color := TmpBrushColor;
  Canvas.Brush.Style := TmpBrushStyle;
end;
(* End Of Clear *)


procedure TFastGEOGraphics.Draw(const Point:TPoint2D);
begin
  DrawPoint(Point);
end;
(* End of Draw *)


procedure TFastGEOGraphics.Draw(const Line:TLine2D);
begin
  DrawLine(Line);
end;
(* End of Draw *)


procedure TFastGEOGraphics.Draw(const Segment:TSegment2D);
begin
  DrawSegment(Segment);
end;
(* End of Draw *)


procedure TFastGEOGraphics.Draw(const Triangle:TTriangle2D);
begin
  DrawTriangle(Triangle);
end;
(* End of Draw *)


procedure TFastGEOGraphics.Draw(const Rectangle:TRectangle);
begin
  DrawRectangle(Rectangle);
end;
(* End of Draw *)


procedure TFastGEOGraphics.Draw(const Quadix:TQuadix2D);
begin
  DrawQuadix(Quadix);
end;
(* End of Draw *)


procedure TFastGEOGraphics.Draw(const Circle:TCircle);
begin
  DrawCircle(Circle);
end;
(* End of Draw *)


procedure TFastGEOGraphics.Draw(const Polygon:TPolygon2D);
begin
  DrawPolygon(Polygon);
end;
(* End of Draw *)


procedure TFastGEOGraphics.Draw(Const Curve:TPoint2DArray);
begin
  DrawCurve(Curve);
end;
(* End of Draw *)


procedure TFastGEOGraphics.Draw(const Obj : TGeometricObject);
begin
  case Obj.ObjectType of
    geoPoint2D   : Draw(Obj.Point2D   );
    geoLine2D    : Draw(Obj.Line2D    );
    geoSegment2D : Draw(Obj.Segment2D );
    geoTriangle2D: Draw(Obj.Triangle2D);
    geoQuadix2D  : Draw(Obj.Quadix2D  );
    geoRectangle : Draw(Obj.Rectangle );
    geoCircle    : Draw(Obj.Circle    );
    geoPolygon2D : DrawPolygon(@Obj.Polygon2D);
  end;
end;
(* End of Draw *)


procedure TFastGEOGraphics.DrawPixel(const x,y:Double);
begin
  Canvas.Pixels[Round(x),Round(y)] := Canvas.Pen.Color;
end;
(* End Of DrawPixel *)


procedure TFastGEOGraphics.DrawPixel(const Point : TPoint2D);
begin
  DrawPixel(Point.x,Point.y);
end;
(* End Of DrawPixel *)


procedure TFastGEOGraphics.DrawPoint(const x,y:Double);
begin
  Canvas.MoveTo(Round(x)    ,Round(y)    );
  Canvas.LineTo(Round(x) + 1,Round(y) + 1);
end;
(* End Of DrawPoint *)


procedure TFastGEOGraphics.DrawPoint(const Point : TPoint2D);
begin
  DrawPoint(Point.x,Point.y);
end;
(* End Of DrawPoint *)


procedure TFastGEOGraphics.DrawLine(const x1,y1,x2,y2:Double);
begin
  Canvas.MoveTo(Round(x1),Round(y1));
  Canvas.LineTo(Round(x2),Round(y2));
end;
(* End Of DrawLine *)


procedure TFastGEOGraphics.DrawLine(const Point1,Point2:TPoint2D);
begin
  DrawLine(Point1.x,Point1.y,Point2.x,Point2.y);
end;
(* End Of DrawLine *)


procedure TFastGEOGraphics.DrawLine(const Line : TLine2D);
begin
  DrawLine(Line[1],Line[2]);
end;
(* End Of DrawLine *)


procedure TFastGEOGraphics.DrawSegment(const x1,y1,x2,y2:Double);
begin
  Canvas.MoveTo(Round(x1),Round(y1));
  Canvas.LineTo(Round(x2),Round(y2));
end;
(* End Of DrawSegment *)


procedure TFastGEOGraphics.DrawSegment(const Point1,Point2:TPoint2D);
begin
  DrawLine(Point1,Point2);
end;
(* End Of Draw Segment *)


procedure TFastGEOGraphics.DrawSegment(const Seg:TSegment2D);
begin
  DrawLine(Seg[1],Seg[2]);
end;
(* End Of Draw Segment *)


procedure TFastGEOGraphics.DrawTriangle(const x1,y1,x2,y2,x3,y3:Double);
begin
  DrawLine(x1,y1,x2,y2);
  DrawLine(x1,y1,x3,y3);
  DrawLine(x2,y2,x3,y3);
end;
(* End Of Draw Triangle *)


procedure TFastGEOGraphics.DrawTriangle(const Point1,Point2,Pnt3:TPoint2D);
begin
  DrawSegment(Point1,Point2);
  DrawSegment(Point1,Pnt3);
  DrawSegment(Point2,Pnt3);
end;
(* End Of Draw Triangle *)


procedure TFastGEOGraphics.DrawTriangle(const Triangle : TTriangle2D);
begin
  DrawSegment(Triangle[1],Triangle[2]);
  DrawSegment(Triangle[2],Triangle[3]);
  DrawSegment(Triangle[3],Triangle[1]);
end;
(* End Of Draw Triangle *)


procedure TFastGEOGraphics.DrawRectangle(const x1,y1,x2,y2:Double);
begin
  DrawSegment(x1,y1,x2,y1);
  DrawSegment(x2,y1,x2,y2);
  DrawSegment(x2,y2,x1,y2);
  DrawSegment(x1,y2,x1,y1);
end;
(* End Of Draw Rectangle *)


procedure TFastGEOGraphics.DrawRectangle(const Point1,Point2:TPoint2D);
begin
  DrawRectangle(Point1.x,Point1.y,Point2.x,Point2.y);
end;
(* End Of Draw Rectangle *)


procedure TFastGEOGraphics.DrawRectangle(const Rectangle : TRectangle);
begin
  DrawRectangle(Rectangle[1],Rectangle[2]);
end;
(* End Of Draw Rectangle *)


procedure TFastGEOGraphics.DrawQuadix(const x1,y1,x2,y2,x3,y3,x4,y4:Double);
begin
  DrawSegment(x1,y1,x2,y2);
  DrawSegment(x2,y2,x3,y3);
  DrawSegment(x3,y3,x4,y4);
  DrawSegment(x4,y4,x1,y1);
end;
(* End Of Draw Quadix *)


procedure TFastGEOGraphics.DrawQuadix(const Point1,Point2,Pnt3,Pnt4:TPoint2D);
begin
  DrawSegment(Point1,Point2);
  DrawSegment(Point2,Pnt3);
  DrawSegment(Pnt3,Pnt4);
  DrawSegment(Pnt4,Point1);
end;
(* End Of Draw Quadix *)


procedure TFastGEOGraphics.DrawQuadix(const Quad:TQuadix2D);
begin
  DrawQuadix(Quad[1],Quad[2],Quad[3],Quad[4]);
end;
(* End Of Draw Quadix *)


procedure TFastGEOGraphics.DrawCircle(const x,y,Radius:Double);
begin
  Canvas.Ellipse(Round(x - Radius),Round(y - Radius),Round(x + Radius),Round(y + Radius));
end;
(* End Of Draw Circle *)


procedure TFastGEOGraphics.DrawCircle(const Point : TPoint2D; const Radius:Double);
begin
  Canvas.Ellipse(Round(Point.x - Radius),Round(Point.y - Radius),Round(Point.x + Radius),Round(Point.y + Radius));
end;
(* End Of Draw Circle *)


procedure TFastGEOGraphics.DrawCircle(const Circle :TCircle);
begin
  DrawCircle(Circle.x,Circle.y,Circle.Radius);
end;
(* End Of Draw Circle *)


procedure TFastGEOGraphics.DrawEllipse(const x,y,a,b:Double);
begin
  Canvas.Ellipse(Round(x - a),Round(y - b),Round(x + a),Round(y + b));
end;
(* End Of Draw Ellipse *)


procedure TFastGEOGraphics.DrawPolygon(const Point:array of TPoint2D);
var
  i : Integer;
  j : Integer;
begin
  j := Length(Point) - 1;
  for i := 0 to Length(Point) - 1 do
  begin
    DrawLine(Point[j],Point[i]);
    j := i;
  end;
end;
(* End Of Draw Polygon *)


procedure TFastGEOGraphics.DrawPolygon(const Polygon:TPolygon2D);
var
  i : Integer;
  j : Integer;
begin
 j := Length(Polygon) -1;
 for i := 0 to Length(Polygon) - 1 do
 begin
  DrawLine(Polygon[j],Polygon[i]);
  j := i;
 end;
end;
(* End Of Draw Polygon *)


procedure TFastGEOGraphics.DrawCurve(Const Curve : TPoint2DArray);
var
  i : Integer;
begin
  for i := 0 To Length(Curve) - 2 do
  begin
    DrawLine(Curve[i],Curve[i + 1]);
  end;
end;
(* End Of Draw Curve *)


procedure TFastGEOGraphics.SetPen(const cPen : TPen);
begin
  Canvas.Pen := cPen;
end;
(* End Of Set Pen *)


function TFastGEOGraphics.GetPen : TPen;
begin
  Result := Canvas.Pen;
end;
(* End Of Get Pen *)


procedure TFastGEOGraphics.SetBrush(const cBrush : TBrush);
begin
  Canvas.Brush := cBrush;
end;
(* End Of Get Brush *)


function TFastGEOGraphics.GetBrush : TBrush;
begin
  Result := Canvas.Brush;
end;
(* End Of Set Brush *)


function TFastGEOGraphics.GetCenterX : Double;
begin
  Result := FWidth * 0.5;
end;
(* End Of Get Center X *)


function TFastGEOGraphics.GetCenterY : Double;
begin
  Result := FHeight * 0.5;
end;
(* End Of Get Center Y *)


procedure TFastGEOCartesianGraphics.Clear(const Color: TColor);
begin
  FGraphicsContext.Clear(Color);
end;

function TFastGEOCartesianGraphics.ConvertXCoordinate(const x: TFloat): TFloat;
begin
  Result := FGraphicsContext.CenterX + x;
end;
(* End Of Convert X Coordinate *)


function TFastGEOCartesianGraphics.ConvertYCoordinate(const y: TFloat): TFloat;
begin
  Result := FGraphicsContext.CenterY  - y;
end;
(* End Of Convert Y Coordinate *)


procedure TFastGEOCartesianGraphics.Draw(const Circle: TCircle);
begin
  DrawCircle(Circle);
end;

procedure TFastGEOCartesianGraphics.Draw(const Quadix: TQuadix2D);
begin
  DrawQuadix(Quadix);
end;

procedure TFastGEOCartesianGraphics.Draw(const Polygon: TPolygon2D);
begin
  DrawPolygon(Polygon);
end;

constructor TFastGEOCartesianGraphics.Create(GraphicsContext: TFastGEOGraphics);
begin
  FGraphicsContext := GraphicsContext;
end;

procedure TFastGEOCartesianGraphics.Draw(const Obj: TGeometricObject);
begin

end;

procedure TFastGEOCartesianGraphics.Draw(const Curve: TPoint2DArray);
begin
end;


procedure TFastGEOCartesianGraphics.Draw(const Line: TLine2D);
begin
  DrawLine(Line);
end;


procedure TFastGEOCartesianGraphics.Draw(const Point: TPoint2D);
begin
  DrawPoint(Point);
end;


procedure TFastGEOCartesianGraphics.Draw(const Segment: TSegment2D);
begin
  DrawSegment(Segment);
end;


procedure TFastGEOCartesianGraphics.Draw(const Rectangle: TRectangle);
begin
  DrawRectangle(Rectangle);
end;


procedure TFastGEOCartesianGraphics.Draw(const Triangle: TTriangle2D);
begin
  DrawTriangle(Triangle);
end;


procedure TFastGEOCartesianGraphics.DrawCircle(const Point :  TPoint2D; const Radius: Double);
begin
  DrawCircle(Point.x,Point.y,Radius);
end;


procedure TFastGEOCartesianGraphics.DrawCircle(const x, y, Radius: Double);
begin
  FGraphicsContext.DrawCircle(ConvertXCoordinate(x),ConvertYCoordinate(y),Radius);
end;


procedure TFastGEOCartesianGraphics.DrawCircle(const Circle : TCircle);
begin
  DrawCircle(Circle.x,Circle.y,Circle.Radius);
end;


procedure TFastGEOCartesianGraphics.DrawCurve(const Curve: TPoint2DArray);
begin
end;


procedure TFastGEOCartesianGraphics.DrawEllipse(const x, y, a, b: Double);
begin
  FGraphicsContext.DrawEllipse(ConvertXCoordinate(x),ConvertYCoordinate(y),a,b);
end;


procedure TFastGEOCartesianGraphics.DrawLine(const x1, y1, x2, y2: Double);
begin
  FGraphicsContext.DrawLine(ConvertXCoordinate(x1),ConvertYCoordinate(y1),
                            ConvertXCoordinate(x2),ConvertYCoordinate(y2));
end;


procedure TFastGEOCartesianGraphics.DrawLine(const Point1, Point2: TPoint2D);
begin
  DrawLine(Point1.x,Point1.y,Point2.x,Point2.y);
end;


procedure TFastGEOCartesianGraphics.DrawLine(const Line : TLine2D);
begin
  DrawLine(Line[1],Line[2]);
end;


procedure TFastGEOCartesianGraphics.DrawPixel(const x, y: Double);
begin
  FGraphicsContext.DrawPixel(ConvertXCoordinate(x),ConvertYCoordinate(y));
end;


procedure TFastGEOCartesianGraphics.DrawPixel(const Point :  TPoint2D);
begin
  DrawPixel(Point.x,Point.y);
end;


procedure TFastGEOCartesianGraphics.DrawPoint(const x, y: Double);
begin
  FGraphicsContext.DrawPoint(ConvertXCoordinate(x),ConvertYCoordinate(y));
end;


procedure TFastGEOCartesianGraphics.DrawPoint(const Point :  TPoint2D);
begin
  DrawPoint(Point.x,Point.y);
end;


procedure TFastGEOCartesianGraphics.DrawPolygon(const Polygon: TPolygon2D);
begin
  FGraphicsContext.DrawPolygon(ConvertPolygon(Polygon));
end;


procedure TFastGEOCartesianGraphics.DrawPolygon(const Point: array of TPoint2D);
begin
end;


procedure TFastGEOCartesianGraphics.DrawQuadix(const x1, y1, x2, y2, x3,y3, x4, y4: Double);
begin
  FGraphicsContext.DrawQuadix(ConvertXCoordinate(x1),ConvertYCoordinate(y1),
                              ConvertXCoordinate(x2),ConvertYCoordinate(y2),
                              ConvertXCoordinate(x3),ConvertYCoordinate(y3),
                              ConvertXCoordinate(x4),ConvertYCoordinate(y4)
                             );
end;


procedure TFastGEOCartesianGraphics.DrawQuadix(const Quad: TQuadix2D);
begin
  FGraphicsContext.DrawQuadix(Quad[1],Quad[2],Quad[3],Quad[4]);
end;


procedure TFastGEOCartesianGraphics.DrawQuadix(const Point1, Point2, Pnt3,Pnt4: TPoint2D);
begin
  FGraphicsContext.DrawQuadix(Point1.x,Point1.y,
                              Point2.x,Point2.y,
                              Pnt3.x,Pnt3.y,
                              Pnt4.x,Pnt4.y);
end;


procedure TFastGEOCartesianGraphics.DrawRectangle(const Point1,Point2: TPoint2D);
begin
  DrawRectangle(Point1.x,Point1.y,Point2.x,Point2.y);
end;


procedure TFastGEOCartesianGraphics.DrawRectangle(const Rectangle :  TRectangle);
begin
  DrawRectangle(Rectangle[1],Rectangle[2]);
end;


procedure TFastGEOCartesianGraphics.DrawRectangle(const x1, y1, x2,y2: Double);
begin
  FGraphicsContext.DrawRectangle(ConvertXCoordinate(x1),ConvertYCoordinate(y1),
                                 ConvertXCoordinate(x2),ConvertYCoordinate(y2));
end;


procedure TFastGEOCartesianGraphics.DrawSegment(const Point1,Point2: TPoint2D);
begin
  DrawSegment(Point1.x,Point1.y,Point2.x,Point2.y);
end;


procedure TFastGEOCartesianGraphics.DrawSegment(const x1, y1, x2,y2: Double);
begin
  FGraphicsContext.DrawSegment(ConvertXCoordinate(x1),ConvertYCoordinate(y1),
                               ConvertXCoordinate(x2),ConvertYCoordinate(y2)
                               );
end;


procedure TFastGEOCartesianGraphics.DrawSegment(const Seg: TSegment2D);
begin
  DrawSegment(Seg[1],Seg[2]);
end;


procedure TFastGEOCartesianGraphics.DrawTriangle(const Triangle :  TTriangle2D);
begin
  DrawTriangle(Triangle[1],Triangle[2],Triangle[3]);
end;


procedure TFastGEOCartesianGraphics.DrawTriangle(const x1, y1, x2, y2, x3,y3: Double);
begin
  FGraphicsContext.DrawTriangle(ConvertXCoordinate(x1),ConvertYCoordinate(y1),
                                ConvertXCoordinate(x2),ConvertYCoordinate(y2),
                                ConvertXCoordinate(x3),ConvertYCoordinate(y3)
                               );
end;


procedure TFastGEOCartesianGraphics.DrawTriangle(const Point1, Point2,Pnt3: TPoint2D);
begin
  DrawTriangle(Point1.x,Point1.y,
               Point2.x,Point2.y,
               Pnt3.x,Pnt3.y);
end;


function TFastGEOCartesianGraphics.ConvertPolygon(const Polygon: TPolygon2D): TPolygon2D;
var
  i : Integer;
begin
  SetLength(Result,Length(Polygon));
  for i := 0 to length(Polygon) - 1 do
  begin
    Result[i].x := ConvertXCoordinate(Polygon[i].x);
    Result[i].y := ConvertYCoordinate(Polygon[i].y);
  end;
end;

end.

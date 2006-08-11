(*************************************************************************)
(*                                                                       *)
(*                          FastGEO Serializer                           *)
(*                         Release Version 0.0.1                         *)
(*                                                                       *)
(* Author: Arash Partow 1997-2005                                        *)
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
(* This is a simple class for serializing FastGEO primitives.            *)
(*                                                                       *)
(*************************************************************************)


unit FastGEOSerializer;

interface


uses
   FastGEO;

const GeoObjectStr : array [low(eGeometricObjectTypes)..high(eGeometricObjectTypes)] of string = (
                                                                                                  'Point2D',
                                                                                                  'Point3D',
                                                                                                  'Line2D',
                                                                                                  'Line3D',
                                                                                                  'Segment2D',
                                                                                                  'Segment3D',
                                                                                                  'Quadix2D',
                                                                                                  'Quadix3D',
                                                                                                  'Triangle2D',
                                                                                                  'Triangle3D',
                                                                                                  'Rectangle',
                                                                                                  'Circle',
                                                                                                  'Sphere',
                                                                                                  'Polygon2D',
                                                                                                  'Polygon3D',
                                                                                                  'QuadraticBezier2D',
                                                                                                  'QuadraticBezier3D',
                                                                                                  'CubicBezier2D',
                                                                                                  'CubicBezier3D',
                                                                                                  'Polyhedron'
                                                                                                 );


type TFastGEOSerializer = class

   public

     constructor Create(_formatstr : string = '8.3');

     function Serialize(const x,y       : Double;            const Title : Boolean = False) : string;          overload;
     function Serialize(const x,y,z     : Double;            const Title : Boolean = False) : string;          overload;

     function Serialize(const Point     : TPoint2D;          const Title : Boolean = False) : string;          overload;
     function Serialize(const Point     : TPoint3D;          const Title : Boolean = False) : string;          overload;

     function Serialize(const Segment   : TSegment2D;        const Title : Boolean = False) : string;          overload;
     function Serialize(const Segment   : TSegment3D;        const Title : Boolean = False) : string;          overload;

     function Serialize(const Line      : TLine2D;           const Title : Boolean = False) : string;          overload;
     function Serialize(const Line      : TLine3D;           const Title : Boolean = False) : string;          overload;

     function Serialize(const Triangle  : TTriangle2D;       const Title : Boolean = False) : string;          overload;
     function Serialize(const Triangle  : TTriangle3D;       const Title : Boolean = False) : string;          overload;

     function Serialize(const Quadix    : TQuadix2D;         const Title : Boolean = False) : string;          overload;
     function Serialize(const Quadix    : TQuadix3D;         const Title : Boolean = False) : string;          overload;

     function Serialize(const Rectangle : TRectangle;        const Title : Boolean = False) : string;          overload;

     function Serialize(const Circle    : TCircle;           const Title : Boolean = False) : string;          overload;
     function Serialize(const Sphere    : TSphere;           const Title : Boolean = False) : string;          overload;

     function Serialize(const Polygon   : TPolygon2D;        const Title : Boolean = False) : string;          overload;
     function Serialize(const Polygon   : TPolygon3D;        const Title : Boolean = False) : String;          overload;

     function Serialize(const Obj       : TGeometricObject;  const Title : Boolean = False) : String;          overload;

   private

     frmtstr : string;

end;



implementation

uses
   SysUtils;

constructor TFastGEOSerializer.Create(_formatstr : string = '8.3');
begin
 frmtstr := '%' + _formatstr + 'f';
end;


function TFastGEOSerializer.Serialize(const x,y : Double; const Title:Boolean = False) : string;
begin
 if Title then
   Result := Format(GeoObjectStr[geoPoint2D] + '(' + frmtstr + ',' + frmtstr + ')',[x,y])
 else
   Result := Format('(' + frmtstr + ',' + frmtstr + ')',[x,y]);
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const x,y,z : Double; const Title:Boolean = False) : string;
begin
 if Title then
   Result := Format(GeoObjectStr[geoPoint3D] + '('+ frmtstr + ',' + frmtstr + ')',[x,y,z])
 else
   Result := Format('(' + frmtstr + ',' + frmtstr + ')',[x,y,z]);
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const Point:TPoint2D; const Title:Boolean = False) : string;
begin
 Result := Serialize(Point.x,Point.y,Title);
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const Point:TPoint3D; const Title:Boolean = False) : string;
begin
 Result := Serialize(Point.x,Point.y,Point.z,Title);
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const Segment : TSegment2D;  const Title:Boolean = False) : string;
begin
 if Title then
  Result := GeoObjectStr[geoSegment2D] + '(' + Serialize(Segment[1]) + Serialize(Segment[2]) + ')'
 else
  Result := '(' + Serialize(Segment[1]) + Serialize(Segment[2]) + ')';
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const Segment : TSegment3D;  const Title:Boolean = False) : string;
begin
 if Title then
  Result := GeoObjectStr[geoSegment3D] + '(' + Serialize(Segment[1]) + Serialize(Segment[2]) + ')'
 else
  Result := '(' + Serialize(Segment[1]) + Serialize(Segment[2]) + ')';
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const Line : TLine2D; const Title : Boolean = False) : string;
begin
 if Title then
  Result := GeoObjectStr[geoLine2D] + '(' + Serialize(Line[1]) + Serialize(Line[2]) + ')'
 else
  Result := '(' + Serialize(Line[1]) + Serialize(Line[2]) + ')';
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const Line : TLine3D; const Title : Boolean = False) : string;
begin
 if Title then
  Result := GeoObjectStr[geoLine3D] + '(' + Serialize(Line[1]) + Serialize(Line[2]) + ')'
 else
  Result := '(' + Serialize(Line[1]) + Serialize(Line[2]) + ')';
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const Triangle:TTriangle2D; const Title:Boolean = False) : string;
begin
 if Title then
  Result := GeoObjectStr[geoTriangle2D] + '(' + Serialize(Triangle[1]) + Serialize(Triangle[2]) + Serialize(Triangle[3]) +  ')'
 else
  Result := '(' + Serialize(Triangle[1]) + Serialize(Triangle[2]) + Serialize(Triangle[3]) + ')';
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const Triangle:TTriangle3D; const Title:Boolean = False) : string;
begin
 if Title then
  Result := GeoObjectStr[geoTriangle3D] + '(' + Serialize(Triangle[1]) + Serialize(Triangle[2]) + Serialize(Triangle[3]) +  ')'
 else
  Result := '(' + Serialize(Triangle[1]) + Serialize(Triangle[2]) + Serialize(Triangle[3]) + ')';
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const Quadix:TQuadix2D; const Title:Boolean = False) : string;
begin
 if Title then
  Result := GeoObjectStr[geoQuadix2D] + '(' + Serialize(Quadix[1]) + Serialize(Quadix[2]) + Serialize(Quadix[3]) + Serialize(Quadix[4]) + ')'
 else
  Result := '(' + Serialize(Quadix[1]) + Serialize(Quadix[2]) + Serialize(Quadix[3]) + Serialize(Quadix[4]) + ')';
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const Quadix:TQuadix3D; const Title:Boolean = False) : string;
begin
 if Title then
  Result := GeoObjectStr[geoQuadix3D] + '(' + Serialize(Quadix[1]) + Serialize(Quadix[2]) + Serialize(Quadix[3]) + Serialize(Quadix[4]) + ')'
 else
  Result := '(' + Serialize(Quadix[1]) + Serialize(Quadix[2]) + Serialize(Quadix[3]) + Serialize(Quadix[4]) + ')';
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const Rectangle : TRectangle;  const Title : Boolean = False) : string;
begin
 if Title then
  Result := GeoObjectStr[geoRectangle] + '(' + Serialize(Rectangle[1]) + Serialize(Rectangle[2]) + ')'
 else
  Result := '(' + Serialize(Rectangle[1]) + Serialize(Rectangle[2]) + ')';
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const Circle : TCircle; const Title : Boolean = False) : string;
begin
 if Title then
  Result := GeoObjectStr[geoCircle] + '(' + Serialize(Circle.x,Circle.y) + Format(frmtstr,[Circle.Radius]) + ')'
 else
  Result := '(' + Serialize(Circle.x,Circle.y) + Format(frmtstr,[Circle.Radius]) + ')';
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const Sphere : TSphere; const Title : Boolean = False) : string;
begin
 if Title then
  Result := GeoObjectStr[geoSphere] + '(' + Serialize(Sphere.x,Sphere.y,Sphere.z) + Format(frmtstr,[Sphere.Radius]) + ')'
 else
  Result := '(' + Serialize(Sphere.x,Sphere.y,Sphere.z) + Format(frmtstr,[Sphere.Radius]) + ')';
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const Polygon : TPolygon2D; const Title : Boolean = False) : String;
var
  i : Integer;
begin
 if Title then
  Result := GeoObjectStr[geoPolygon2D] + '('
 else
  Result := '(';

 for i := 0 to Length(Polygon) - 1 do
 begin
  Result := Result + Serialize(Polygon[i]);
  if i < Length(Polygon) - 1 then
 end;
 Result := Result + ')';
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const Polygon : TPolygon3D; const Title : Boolean = False) : String;
var
  i : Integer;
begin
 if Title then
  Result := GeoObjectStr[geoPolygon3D] + '('
 else
  Result := '(';

 for i := 0 to Length(Polygon) - 1 do
 begin
  Result := Result + Serialize(Polygon[i]);
 end;
 Result := Result + ')';
end;
(* End Of Serialize *)


function TFastGEOSerializer.Serialize(const Obj : TGeometricObject;  const Title : Boolean = False) : String;
begin
 case Obj.ObjectType of
  geoSegment2D  : Result := Serialize(Obj.Segment2D,Title);
  geoRectangle  : Result := Serialize(Obj.Rectangle,Title);
  geoTriangle2D : Result := Serialize(Obj.Triangle2D,Title);
  geoQuadix2D   : Result := Serialize(Obj.Quadix2D,Title);
  geoCircle     : Result := Serialize(Obj.Circle,Title);
  geoPolygon2D  : Result := Serialize(Obj.Polygon2D^,Title);
  else
   Result := '';
 end;
end;
(* End Of Serialize *)



end.

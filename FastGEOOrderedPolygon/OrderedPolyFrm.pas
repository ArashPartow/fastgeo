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
(*************************************************************************)


unit OrderedPolyFrm;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ComCtrls,
  ExtCtrls,
  OrderedPolygonUnit,
  FastGEO,
  FastGEOGraphics;

type
  TOrderedPolygonForm = class(TForm)
    Surface        : TPaintBox;
    Panel1         : TPanel;
    StatusBar1     : TStatusBar;
    Splitter1      : TSplitter;
    Panel2         : TPanel;
    GenRandPntsBtn : TButton;
    DispEdgeBtn    : TButton;
    OrdPolyBtn     : TButton;
    procedure FormCreate(Sender: TObject);
    procedure GenRandPntsBtnClick(Sender: TObject);
    procedure DispEdgeBtnClick(Sender: TObject);
    procedure OrdPolyBtnClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    procedure DrawPoints;
    procedure DisplayEdges;

  end;

const MAX_POINTS = 50;

var OrderedPolygonForm : TOrderedPolygonForm;
    Point              : Array of TPoint2D;

implementation

{$R *.dfm}

procedure TOrderedPolygonForm.FormCreate(Sender: TObject);
begin
 SetLength(Point,MAX_POINTS);
end;

procedure TOrderedPolygonForm.DrawPoints;
var
  I   : Integer;
  FGr : TFastGeoGraphics;
begin
 Surface.Canvas.Brush.Style := bsSolid;
 Surface.Canvas.Brush.Color := clWhite;
 Surface.Canvas.FillRect(Rect(0,0,Surface.Width,Surface.Height));
 Surface.Canvas.Brush.Color := clBlack;
 Surface.Canvas.Pen.Color   := clBlack;
 Surface.Canvas.Pen.Width   := 3;
 FGr := TFastGeoGraphics.Create(Surface.Canvas);
 for I := 0 to MAX_POINTS - 1 do
 begin
   FGr.DrawPoint(Point[I]);
 end;
end;


procedure TOrderedPolygonForm.DisplayEdges;
var
  I   : Integer;
  FGr : TFastGeoGraphics;
begin
 Surface.Canvas.Brush.Style:=bsSolid;
 Surface.Canvas.Brush.Color:=clWhite;
 Surface.Canvas.FillRect(Rect(0,0,Surface.Width,Surface.Height));
 Surface.Canvas.Brush.Color:=clBlack;
 Surface.Canvas.Pen.Color:= clBlack;
 Surface.Canvas.Pen.Width:=2;
 FGr := TFastGeoGraphics.Create(Surface.Canvas);
 for i := 0 to MAX_POINTS - 1 do
 begin
   FGr.DrawLine(Point[I], Point[(I+1) mod MAX_POINTS]);
 end;
end;


procedure TOrderedPolygonForm.GenRandPntsBtnClick(Sender: TObject);
begin
 GenerateRandomPoints(10,10,Surface.Width-10,Surface.Height-10,Point);
 DrawPoints;
end;


procedure TOrderedPolygonForm.DispEdgeBtnClick(Sender: TObject);
begin
 DisplayEdges;
end;


procedure TOrderedPolygonForm.OrdPolyBtnClick(Sender: TObject);
var
  OrdPoly : TOrderedPolygon2D;
  i       : Integer;
  j       : Integer;
  Rec     : TRectangle;
begin
 if Length(Point) = 0 then Exit;

 OrdPoly := TOrderedPolygon2D.Create;
 OrdPoly.OrderedPolygon(Point);
 DisplayEdges;
 Rec := RectangularHull(Point);
 for i := 0 to Surface.Width - 1 do
  for j := 0 To Surface.Height - 1 do
  begin
   if PointInRectangle(i,j,Rec) then
     if PointInPolygon(i,j,TPolygon2D(Point)) then
       Surface.Canvas.Pixels[i,j] := clBlack;
  end;

  if ConvexPolygon(TPolygon2D(Point)) then
    MessageDlg('I think there is a big problem!!!', mtInformation,[mbOk], 0);

end;

end.

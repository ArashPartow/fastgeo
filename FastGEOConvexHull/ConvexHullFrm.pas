(*************************************************************************)
(*                                                                       *)
(*                          FastGEO Convex Hull                          *)
(*                         Release Version 0.0.1                         *)
(*                                                                       *)
(* Author: Arash Partow 1997-2005                                        *)
(* URL: http://fastgeo.partow.net                                        *)
(*      http://www.partow.net/projects/fastgeo/index.html                *)
(*                                                                       *)
(* Copyright notice:                                                     *)
(* Free use of the FastGEO Convex Hull is permitted under the guidelines *)
(* and in accordance with the most current version of the Common Public  *)
(* License.                                                              *)
(* http://www.opensource.org/licenses/cpl.php                            *)
(*                                                                       *)
(* Description:                                                          *)
(* This is an implementation of the Graham-scan convex hull algorithm    *)
(* using FastGEO as the base for geometric primitives.                   *)
(*************************************************************************)


unit ConvexHullFrm;

interface

uses
  Windows,
  SysUtils,
  Graphics,
  Forms,
  Buttons,
  ExtCtrls,
  ComCtrls,
  Controls,
  StdCtrls,
  Classes,
  FastGEO,
  FastGEOGraphics,
  ConvexHullUnit;


type
  TConvexHullForm = class(TForm)
    Splitter1          : TSplitter;
    StatusBar1         : TStatusBar;
    Panel1             : TPanel;
    Panel2             : TPanel;
    GenRandPntsBtn     : TButton;
    DisplayCHullBtn    : TButton;
    Surface            : TPaintBox;
    PointCountComboBox : TComboBox;
    beginTestButton    : TButton;
    StopTestButton     : TButton;
    TestCounterEdit    : TEdit;
    CHStrategyComboBox : TComboBox;
    Label1             : TLabel;
    DrawCheckBox       : TCheckBox;
    PostScriptCheckBox : TCheckBox;
    StdOutputCheckBox  : TCheckBox;
    procedure GenRandPntsBtnClick     (Sender: TObject);
    procedure DisplayCHullBtnClick    (Sender: TObject);
    procedure PointCountComboBoxChange(Sender: TObject);
    Procedure BeginTestButtonClick    (Sender: TObject);
    procedure StopTestButtonClick     (Sender: TObject);
    procedure FormCreate              (Sender: TObject);

  private
    { Private declarations }
    DoTestSequence  : Boolean;
    StartTime       : Cardinal;
    EndTime         : Cardinal;
    MAX_POINTS      : LongInt;
    PointsGenerated : Boolean;
    Point           : array of TPoint2D;

  public
    { Public declarations }
   procedure SetPoints;
   procedure DrawPoints(const ForceDraw : Boolean = False);
   procedure DrawHull(const CHull : TPolygon2D; const ForceDraw : Boolean = False); overload;
   procedure DrawErrorPoint(const Pnt : TPoint2D);
   function  VerifyHullIntegrity(const CHull: TPolygon2D; const Point : array of TPoint2D): Boolean;
   procedure ProducePostScript  (const CHull: TPolygon2D; const Point : array of TPoint2D);
   procedure ProduceStdOut      (const CHull: TPolygon2D; const Point : array of TPoint2D);


  end;


var
  ConvexHullForm  : TConvexHullForm;

implementation

{$R *.dfm}

procedure TConvexHullForm.DrawPoints(const ForceDraw : Boolean = False);
var
  i   : Integer;
  FGr : TFastGeoGraphics;
begin
 if (not ForceDraw) and (not DrawCheckBox.Checked) then Exit;
 Surface.Canvas.Brush.Style := bsSolid;
 Surface.Canvas.Brush.Color := clWhite;
 Surface.Canvas.FillRect(Rect(0,0,Surface.Width,Surface.Height));
 Surface.Canvas.Brush.Color := clBlack;
 Surface.Canvas.Pen.Color   := clRed;
 Surface.Canvas.Pen.Width   := 8;
 FGr := TFastGeoGraphics.Create(Surface.Canvas);
 for i := 0 to MAX_POINTS - 1 do
 begin
  FGr.DrawPoint(Point[i]);
 end;
end;


procedure TConvexHullForm.DrawHull(const CHull : TPolygon2D;  const ForceDraw : Boolean = False);
var
  FGr : TFastGeoGraphics;
begin
 if (not ForceDraw) and (not DrawCheckBox.Checked) then Exit;
 FGr := TFastGeoGraphics.Create(Surface.Canvas);
 try
  FGr.Pen.Width := 4;
  Fgr.Pen.Color := clBlue;
  Fgr.Draw(CHull);
 finally
   FGr.Free;
 end;
end;


procedure TConvexHullForm.DrawErrorPoint( const Pnt : TPoint2D);
var
  FGr : TFastGeoGraphics;
begin
 FGr := TFastGeoGraphics.Create(Surface.Canvas);
 try
  FGr.Pen.Width   := 4;
  FGr.Brush.Style := bsClear;
  FGr.DrawCircle(Pnt,10);
 finally
   FGr.Free;
 end;
end;


procedure TConvexHullForm.SetPoints;
begin
 GenerateRandomPoints(10,10,Surface.Width-10,Surface.Height-10,Point);
end;


procedure TConvexHullForm.GenRandPntsBtnClick(Sender: TObject);
begin
 Point := Nil;
 SetLength(Point,MAX_POINTS);
 SetPoints;
 DrawPoints;
 PointsGenerated := True;
end;


procedure TConvexHullForm.DisplayCHullBtnClick(Sender: TObject);
var
  CHull : TPolygon2D;
begin
 if not PointsGenerated then
   Exit;

 try

   CHull := ConvexHull(Point);
   DrawHull(CHull);

   if PostScriptCheckBox.Checked then
   begin
    ProducePostScript(CHull,Point);
   end;

   if StdOutputCheckBox.Checked then
   begin
    ProduceStdOut(CHull,Point);
   end;

 finally
   Finalize(CHull);
 end;
end;


procedure TConvexHullForm.PointCountComboBoxChange(Sender: TObject);
begin
 MAX_POINTS := StrToInt(PointCountComboBox.Items[PointCountComboBox.ItemIndex]);
 GenRandPntsBtnClick(Sender);
end;


function TConvexHullForm.VerifyHullIntegrity(const CHull: TPolygon2D; const Point : array of TPoint2D) : Boolean;
var
  I                      : Integer;
  J                      : Integer;
  PointApartOfConvexHull : Boolean;
  MinDist                : Double;
  PointList              : TStrings;
begin
 Result := False;
 (* Verify Hull is really convex *)
 if not ConvexPolygon(CHull) then
 begin
  DrawHull(CHull,True);
  Sleep(1000);
  PointList := TStringList.Create;
  for i := 0 to Length(Point) - 1 do
  begin
   PointList.Add('Point['+IntToStr(i)+'].x := '+ FloatToStr(Point[i].x)+ ';   Point['+IntToStr(i)+'].y := '+FloatToStr(Point[i].y)+';');
  end;
  PointList.SaveToFile('error-'+IntToStr(GetTickCount)+'.txt');
  PointList.Free;
  Exit;
 end;

 for i := 0 to Length(Point) - 1 do
 begin
  PointApartOfConvexHull := False;
  for j := 0 to Length(CHull) - 1 do
  begin
   if IsEqual(CHull[j],Point[i]) then
   begin
    PointApartOfConvexHull := True;
    break;
   end;
  end;

  if not PointApartOfConvexHull then
  begin
   if not PointInConvexPolygon(Point[i],CHull) then
   begin
    if not PointInPolygon(Point[i],CHull) then
    begin
     if not PointOnPolygon(Point[i],CHull) then
     begin
      MinDist := MinimumDistanceFromPointToPolygon(Point[i],CHull);
      if MinDist > 0.9 then
      begin
       DrawHull(CHull,True);
       DrawErrorPoint(Point[i]);
       PointList := TStringList.Create;
       for j := 0 To Length(Point) - 1  do
       begin
        PointList.Add('Point['+IntToStr(j)+'].x := '+ FloatToStr(Point[j].x)+ ';   Point['+IntToStr(j)+'].y := '+FloatToStr(Point[j].y)+';');
       end;
       PointList.SaveToFile('error-II-'+IntToStr(GetTickCount)+'.txt');
       PointList.Free;
       Exit;
      end;
     end;
    end;
   end;
  end;
 end;
 Result := True;
end;


procedure TConvexHullForm.BeginTestButtonClick(Sender: TObject);
const MAX_HULLS = 10000;

var
  CHull      : TPolygon2D;
  CHCount    : Integer;
begin

 StartTime      := GetTickCount;
 DoTestSequence := True;
 CHCount        := 0;
 SetLength(Point,MAX_POINTS);

 while DoTestSequence do
 begin

  try

   SetPoints;

   Surface.Canvas.Pen.Color   := clLime;
   Surface.Canvas.Pen.Width   := 8;
   Surface.Canvas.Brush.Style := bsClear;
   DrawPoints;

   CHull := ConvexHull(Point);
   Surface.Canvas.Pen.Color := clLime;

   if VerifyHullIntegrity(CHull,Point) then
    DrawHull(CHull);

  finally
   if Assigned(CHull) then Finalize(CHull);
  end;

  Inc(CHCount);
  TestCounterEdit.Text := IntToStr(CHCount);
  Application.ProcessMessages;

 end;

 EndTime := GetTickCount;

 (*
   MessageDlg(format('%d hulls in %dms - %5.3f hulls/per ms',[MAX_HULLS,Abs(EndTime - StartTime), Abs(EndTime - StartTime) / CHCount]), mtInformation, [mbOk], 0);
 *)

end;


procedure TConvexHullForm.StopTestButtonClick(Sender: TObject);
begin
 DoTestSequence := false;
end;


procedure TConvexHullForm.FormCreate(Sender: TObject);
begin
 MAX_POINTS      := StrToInt(PointCountComboBox.Items[PointCountComboBox.ItemIndex]);
 PointsGenerated := False;
end;


procedure TConvexHullForm.ProducePostScript(const CHull: TPolygon2D; const Point : array of TPoint2D);
var
  OutPut : TStrings;
  xmin   : Double;
  ymin   : Double;
  xmax   : Double;
  ymax   : Double;
  i      : Integer;
begin
 OutPut := TStringList.Create;

 xmin := Point[0].x;
 xmax := Point[0].x;
 ymin := Point[0].y;
 ymax := Point[0].y;

 for i := 1 to Length(Point) - 1 do
 begin
  if Point[i].x > xmax then
    xmax := Point[i].x
  else if Point[i].x < xmin then
    xmin := Point[i].x;

  if Point[i].y > ymax then
    ymax := Point[i].y
  else if Point[i].y < ymin then
    ymin := Point[i].y;
 end;


 OutPut.Add('%!PS');
 OutPut.Add('%%Creator: FastGEO Convex Hull (Arash Partow)');
 OutPut.Add('%%BoundingBox: '+ IntToStr(Round(xmin)) + ' ' + IntToStr(Round(ymin)) + ' ' + IntToStr(Round(xmax)) + ' ' + IntToStr(Round(ymax)));
 OutPut.Add('%%EndComments');
 OutPut.Add('.00 .00 setlinewidth');
 OutPut.Add('newpath');
 OutPut.Add('%%Points:');

 for i := 0 To length(Point) - 1 do
 begin
  OutPut.Add(IntToStr(Round(Point[i].x)) + ' '  + IntToStr(Round(Point[i].y)) + ' 3  0  360 arc stroke');
 end;

 OutPut.Add('closepath');


 OutPut.Add('%%Hull:');
 OutPut.Add('newpath');

 OutPut.Add(IntToStr(Round(CHull[0].x)) + ' ' + IntToStr(Round(CHull[0].y)) + ' moveto');

 for i := 1 To Length(CHull) - 1 do
 begin
  OutPut.Add(IntToStr(Round(CHull[i].x)) + ' '  + IntToStr(Round(CHull[i].y)) + ' lineto');
 end;

 OutPut.Add('closepath stroke');

 OutPut.Add('showpage');
 OutPut.Add('%%EOF');

 OutPut.SaveToFile('fastgeo-convexhull'+IntToStr(GetTickCount)+'.eps');

end;


procedure TConvexHullForm.ProduceStdOut(const CHull: TPolygon2D; const Point : array of TPoint2D);
var
  OutPut : TStrings;
  I      : Integer;
begin
 OutPut := TStringList.Create;

 (* Print out set of points *)
 Output.Add(IntToStr(Length(Point)));
 for i := 0 To Length(Point) - 1 do
 begin
  Output.Add(FloatToStr(Point[i].x) + ' ' + FloatToStr(Point[i].y));
 end;

 (* Print out convex hull *)
 OutPut.Add(IntToStr(Length(CHull)));
 for i := 0 To Length(CHull) - 1 do
 begin
  Output.Add(FloatToStr(CHull[i].x) + ' ' + FloatToStr(CHull[i].y));
 end;

 Output.SaveToFile('fastgeo-convexhull'+IntToStr(GetTickCount)+'.stdout');
end;

end.

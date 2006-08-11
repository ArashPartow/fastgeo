(*************************************************************************)
(*                                                                       *)
(*                       FastGEO Barycentric Demo                        *)
(*                         Release Version 0.0.1                         *)
(*                                                                       *)
(* Author: Arash Partow 1997-2005                                        *)
(* URL: http://fastgeo.partow.net                                        *)
(*      http://www.partow.net/projects/fastgeo/index.html                *)
(*                                                                       *)
(* Copyright notice:                                                     *)
(* Free use of the FastGEO Barycentric Demo is permitted under the       *)
(* guidelines and in accordance with the most current version of the     *)
(* Common Public License.                                                *)
(* http://www.opensource.org/licenses/cpl.php                            *)
(*                                                                       *)
(* Description:                                                          *)
(* This is a demonstration of cartesian to barycentric and barycentric to*)
(* cartesian coordiante conversions using FastGEO.                       *)
(*                                                                       *)
(*************************************************************************)



unit BarycentricDemoForm;

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
  ExtCtrls,
  ComCtrls,
  StdCtrls,
  FastGEO,
  FastGEOGraphics;

type
  TBarycentricForm = class(TForm)
    StatusBar1     : TStatusBar;
    Paint          : TPaintBox;
    Panel1         : TPanel;
    WEdit          : TEdit;
    MYEdit         : TEdit;
    VEdit          : TEdit;
    UEdit          : TEdit;
    MXEdit         : TEdit;
    BYEdit         : TEdit;
    BXEdit         : TEdit;
    DeltaYEdit     : TEdit;
    DeltaXEdit     : TEdit;
    BaryTotalEdit  : TEdit;
    Label1         : TLabel;
    Label2         : TLabel;
    Label3         : TLabel;
    Label4         : TLabel;
    Label5         : TLabel;
    Label6         : TLabel;
    Label7         : TLabel;
    Label8         : TLabel;
    Label9         : TLabel;
    Label10        : TLabel;
    ReGenButton    : TButton;

    procedure FormCreate(Sender: TObject);
    procedure PaintMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ReGenButtonClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);

  private
    { Private declarations }
    BU          : TBarycentricUnit;
    PrevCheckIn : Boolean;

    procedure generate_triangle;
    procedure draw_triangle;

  public
    { Public declarations }
  end;

var
  BarycentricForm: TBarycentricForm;

implementation

{$R *.dfm}

procedure TBarycentricForm.generate_triangle;
var
  Tri : TTriangle2D;
begin
 Randomize;
 Repeat

   Tri[1].x := Random(Paint.Width  - 10) + 5.0;
   Tri[2].x := Random(Paint.Width  - 10) + 5.0;
   Tri[3].x := Random(Paint.Width  - 10) + 5.0;

   Tri[1].y := Random(Paint.Height - 10) + 5.0;
   Tri[2].y := Random(Paint.Height - 10) + 5.0;
   Tri[3].y := Random(Paint.Height - 10) + 5.0;

 Until not IsDegenerate(Tri);
 BU := CreateBarycentricUnit(Tri[1].x,Tri[1].y,Tri[2].x,Tri[2].y,Tri[3].x,Tri[3].y);
end;


procedure TBarycentricForm.draw_triangle;
var
  Graphic : TFastGEOGraphics;
begin
 Graphic := TFastGEOGraphics.Create(Paint.Canvas,Paint.Width,Paint.Height);
 try
  Graphic.Clear(clWhite);
  Graphic.DrawTriangle(BU.x1,BU.y1,BU.x2,BU.y2,BU.x3,BU.y3);
 finally
   Graphic.Free;
 end;
end;



procedure TBarycentricForm.FormCreate(Sender: TObject);
begin
 PrevCheckIn            := false;
 Paint.Canvas.Pen.Width := 3;
 generate_triangle;
 draw_triangle;
end;


procedure TBarycentricForm.PaintMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  u       : Double;
  v       : Double;
  w       : Double;
  Bx      : Double;
  By      : Double;
  Graphic : TFastGEOGraphics;
begin
 ConvertCartesianToBarycentric(BU,x,y,u,v,w);

 UEdit.Text := FloatToStr(u);
 VEdit.Text := FloatToStr(v);
 WEdit.Text := FloatToStr(w);
 BaryTotalEdit.Text := FloatToStr(u+v+w);

 MXEdit.Text := IntToStr(x);
 MYEdit.Text := IntToStr(y);

 ConvertBarycentricToCartesian(u,v,w,BU,Bx,By);

 BXEdit.Text := FloatToStr(Bx);
 BYEdit.Text := FloatToStr(By);

 DeltaXEdit.Text := FloatToStr(abs(Bx - x));
 DeltaYEdit.Text := FloatToStr(abs(By - y));

 if GreaterThanOrEqual(u,0.0) and LessThanOrEqual(u,1.0) and
    GreaterThanOrEqual(v,0.0) and LessThanOrEqual(v,1.0) and
    GreaterThanOrEqual(w,0.0) and LessThanOrEqual(w,1.0) then
 begin
   StatusBar1.SimpleText := 'Point In Triangle';
   if not PrevCheckIn  then
   begin
     PrevCheckIn := True;
     Graphic := TFastGEOGraphics.Create(Paint.Canvas,Paint.Width,Paint.Height);
     try
      Graphic.Clear(clWhite);
      Graphic.Pen.Color := clLime;
      Graphic.DrawTriangle(BU.x1,BU.y1,BU.x2,BU.y2,BU.x3,BU.y3);
     finally
       Graphic.Free;
     end;
   end;
 end
 else
 begin
   StatusBar1.SimpleText := 'Point Outside of Triangle';
   if PrevCheckIn then
   begin
     PrevCheckIn := False;
     Graphic := TFastGEOGraphics.Create(Paint.Canvas,Paint.Width,Paint.Height);
     try
      Graphic.Clear(clWhite);
      Graphic.Pen.Color := clRed;
      Graphic.DrawTriangle(BU.x1,BU.y1,BU.x2,BU.y2,BU.x3,BU.y3);
     finally
       Graphic.Free;
     end;
   end;
 end;
end;


procedure TBarycentricForm.ReGenButtonClick(Sender: TObject);
begin
 generate_triangle;
 draw_triangle;
end;


procedure TBarycentricForm.FormPaint(Sender: TObject);
begin
 draw_triangle;
end;

End.

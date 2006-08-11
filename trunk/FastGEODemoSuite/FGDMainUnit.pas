(*************************************************************************)
(*                                                                       *)
(*                  FastGEO Demonstration Suite                          *)
(* File: FGDMainUnit                                                     *)
(* Purpose: Main Unit                                                    *)
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


unit FGDMainUnit;

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
  Menus,
  FGDAboutForm,
  FGDReleaseNotes,
  FastGEO,
  FastGEOGraphics,
  FGDS_Intersections,
  FGDS_Clipping,
  FGDS_Triangles,
  FGDS_Randomize;


type eFunctions = (
                   eSegmentIntersections,
                   eRandomSegmentIntersections,
                   eRandomCircleIntersections,
                   eSegmentTriangleClipping,
                   eSegmentQuadixClipping,
                   eSegmentRectangleClipping,
                   eSegmentCircleClipping,
                   eRectangleRectangleClipping,
                   eCircumcircle,
                   eInscribedCircle,
                   eTorricelliPoint,
                   eCPOTriangleFP,
                   eCPOQuadixFP,
                   eCPOCircleFP,
                   eCPOAABBFP,
                   eCPOCircleFS,
                   eRandPntsAABB,
                   eRandPntsTriangle,
                   eRandPntsQuadix,
                   eRandPntsCircle,
                   ePolygonCentroid,
                   eRotateSegments,
                   eRotateTriangles,
                   eRotateQuadix
                  );


const cFunctionStrings : array [Low(eFunctions)..High(eFunctions)] of string = (
                                                                                'Segment Intersections',
                                                                                'Random Segment Intersections',
                                                                                'Random Circle Intersections',
                                                                                'Segment Triangle Clipping',
                                                                                'Segment Quadix Clipping',
                                                                                'Segment Rectangle Clipping',
                                                                                'Segment Circle Clipping',
                                                                                'Rectangle Rectangle Clipping',
                                                                                'Circumcircle',
                                                                                'Inscribed Circle',
                                                                                'TorricelliPoint',
                                                                                'Closest Point On Triangle Form Point',
                                                                                'Closest Point On Quadix Form Point',
                                                                                'Closest Point On Circle Form Point',
                                                                                'Closest Point On AABB Form Point',
                                                                                'Closest Point On Circle Form Segment',
                                                                                'Random Points Within AABB',
                                                                                'Random Points Within Triangle',
                                                                                'Random Points Within Quadix',
                                                                                'Random Point Within Circle',
                                                                                'Polygon Centroid',
                                                                                'Rotate Segments',
                                                                                'Rotate Triangles',
                                                                                'Rotate Quadix'
                                                                               );


type FastGEOProctor = procedure(const Graphic : TFastGeoGraphics);

type fg_functionality = record
     functype : eFunctions;
     proctor  : FastGEOProctor;
     valid    : Boolean;
end;



type
  TMainFastGeoForm = class(TForm)
    PaintPanel             : TPanel;
    StatusBar              : TStatusBar;
    MainMenu               : TMainMenu;
    MenuItem_File          : TMenuItem;
    MenuItem_Exit          : TMenuItem;
    MenuItem_Help          : TMenuItem;
    MenuItem_About         : TMenuItem;
    ControlPanel           : TPanel;
    OptionsPanel           : TPanel;
    RefreshButton          : TButton;
    MainPageControl        : TPageControl;
    DemoInfoTabSheet       : TTabSheet;
    InfoMemo               : TMemo;
    BasicFunctionsTabSheet : TTabSheet;
    BFGroup                : TRadioGroup;
    Splitter               : TSplitter;
    PaintBox               : TPaintBox;
    ReleaseNotes           : TMenuItem;
    procedure BFGroupClick       (Sender: TObject);
    procedure FormCreate         (Sender: TObject);
    procedure MenuItem_AboutClick(Sender: TObject);
    procedure MenuItem_ExitClick (Sender: TObject);
    procedure RefreshButtonClick (Sender: TObject);
    procedure PaintBoxResize     (Sender: TObject);
    procedure PaintBoxPaint      (Sender: TObject);
    procedure ReleaseNotesClick  (Sender: TObject);

  private
    { Private declarations }

    FuncList : Array of fg_functionality;

    procedure ExecuteProctor;
    procedure Clear;

  public
    { Public declarations }

  end;

var
  MainFastGeoForm: TMainFastGeoForm;

implementation

{$R *.dfm}

function Create_FGFType(const functype : eFunctions; const proctor : FastGEOProctor):fg_functionality;
begin
  Result.functype := functype;
  Result.proctor  := proctor;
  Result.valid    := True;
end;


procedure TMainFastGeoForm.FormCreate(Sender: TObject);
var
  eFuncIter : eFunctions;
  i         : Integer;
begin
  for eFuncIter := Low(eFunctions) to High(eFunctions) do
  begin
    BFGroup.Items.Add(cFunctionStrings[eFuncIter]);
  end;

  if Assigned(FuncList) then
    Finalize(FuncList);

  SetLength(FuncList,Ord(High(eFunctions)) + 1);

  for i := 0 to Length(FuncList) - 1 do
  begin
    FuncList[i].valid := False;
  end;

  (* Register Demo Functions *)
  FuncList[Ord(eSegmentIntersections)      ] := Create_FGFType(eSegmentIntersections,       SegmentIntersect00     );
  FuncList[Ord(eRandomSegmentIntersections)] := Create_FGFType(eRandomSegmentIntersections, SegmentIntersect01     );
  FuncList[Ord(eRandomCircleIntersections) ] := Create_FGFType(eRandomCircleIntersections,  CircleIntersect00      );
  FuncList[Ord(eSegmentTriangleClipping)   ] := Create_FGFType(eSegmentTriangleClipping,    SegmentTriangleClip    );
  FuncList[Ord(eSegmentQuadixClipping)     ] := Create_FGFType(eSegmentQuadixClipping,      SegmentQuadixClip      );
  FuncList[Ord(eSegmentRectangleClipping)  ] := Create_FGFType(eSegmentRectangleClipping,   SegmentRectangleClip   );
  FuncList[Ord(eSegmentCircleClipping)     ] := Create_FGFType(eSegmentCircleClipping,      SegmentCircleClip      );
  FuncList[Ord(eRectangleRectangleClipping)] := Create_FGFType(eRectangleRectangleClipping, RectangleRectangleClip );
  FuncList[Ord(eCircumcircle)              ] := Create_FGFType(eCircumcircle,               TriangleCircumcircle   );
  FuncList[Ord(eInscribedCircle)           ] := Create_FGFType(eInscribedCircle,            TriangleInscribedCircle);
  FuncList[Ord(eTorricelliPoint)           ] := Create_FGFType(eTorricelliPoint,            TriangleTorricelliPoint);
  FuncList[Ord(eRandPntsAABB)              ] := Create_FGFType(eRandPntsAABB,               RandomPointsAABB       );
  FuncList[Ord(eRandPntsTriangle)          ] := Create_FGFType(eRandPntsTriangle,           RandomPointsTriangle   );
  FuncList[Ord(eRandPntsQuadix)            ] := Create_FGFType(eRandPntsQuadix,             RandomPointsQuadix     );
  FuncList[Ord(eRandPntsCircle)            ] := Create_FGFType(eRandPntsCircle,             RandomPointsCircle     );

  InfoMemo.Lines.Add('FastGEO Library Information');
  InfoMemo.Lines.Add('Version information: '+FastGEO.VersionInformation);
  InfoMemo.Lines.Add('Author information:  '+FastGEO.AuthorInformation);
  InfoMemo.Lines.Add('Epoch information:   '+FastGEO.EpochInformation);
  InfoMemo.Lines.Add('Most recent update:  '+FastGEO.RecentUpdate);

  Clear;

end;

procedure TMainFastGeoForm.RefreshButtonClick(Sender: TObject);
begin
  ExecuteProctor;
end;


procedure TMainFastGeoForm.BFGroupClick(Sender: TObject);
begin
  ExecuteProctor;
end;


procedure TMainFastGeoForm.ExecuteProctor;
var
  Graphic : TFastGEOGraphics;
begin
  if BFGroup.ItemIndex > -1 then
  begin
    Graphic := TFastGEOGraphics.Create(PaintBox.Canvas,PaintBox.Width,PaintBox.Height);
    try
      PaintBox.Canvas.Brush.Style := bsClear;
      StatusBar.SimpleText := 'Current View: ' + BFGroup.Items[BFGroup.ItemIndex];
      if FuncList[BFGroup.ItemIndex].valid then
      begin
        try
          FuncList[BFGroup.ItemIndex].proctor(Graphic);
        except
          InfoMemo.Lines.Add('Error: ' + BFGroup.Items[BFGroup.ItemIndex]);
        end;
        InfoMemo.Lines.Add('Executed: ' + BFGroup.Items[BFGroup.ItemIndex]);
      end
      else
      begin
        InfoMemo.Lines.Add('Error: ' + BFGroup.Items[BFGroup.ItemIndex] + ' has not been registered.');
      end;
    finally
      Graphic.Free;
    end;
  end;
end;


procedure TMainFastGeoForm.MenuItem_AboutClick(Sender: TObject);
begin
  FDGAboutForm.ShowModal;
end;

procedure TMainFastGeoForm.MenuItem_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainFastGeoForm.ReleaseNotesClick(Sender: TObject);
begin
  FGDReleaseNotesForm.ShowModal;
end;


procedure TMainFastGeoForm.PaintBoxResize(Sender: TObject);
begin
 {$IFDEF GR32_USED}
   PaintBox.Buffer.Clear(clWhite32);
 {$ENDIF}
 ExecuteProctor;
end;


procedure TMainFastGeoForm.Clear;
var
  Graphic : TFastGEOGraphics;
begin
  Graphic := TFastGEOGraphics.Create(PaintBox.Canvas,PaintBox.Width,PaintBox.Height);
  try
    Graphic.Clear(clWhite);
  finally
    Graphic.Free;
  end;
end;


procedure TMainFastGeoForm.PaintBoxPaint(Sender: TObject);
begin
  Clear;
  ExecuteProctor;
end;

end.

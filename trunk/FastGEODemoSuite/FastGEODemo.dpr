(*************************************************************************)
(*                                                                       *)
(*                  FastGEO Demonstration Suite                          *)
(*                                                                       *)
(* Author: Arash Partow 1997-2005                                        *)
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

program FastGEODemo;

uses
  Forms,
  Graphics,
  FGDMainUnit,
  FGDAboutForm,
  FastGEO,
  FastGEOGraphics,
  FGDS_Intersections,
  FGDS_Clipping,
  FGDS_Triangles,
  FGDS_Randomize,
  FGDReleaseNotes;

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'FastGEO Demonstration Suite (version 0.0.1)';
  Application.CreateForm(TMainFastGeoForm, MainFastGeoForm);
  Application.CreateForm(TFDGAboutForm, FDGAboutForm);
  Application.CreateForm(TFGDReleaseNotesForm, FGDReleaseNotesForm);
  Application.Run;
end.

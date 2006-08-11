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


program OrderedPolygon;

uses
  Forms,
  OrderedPolyFrm,
  OrderedPolygonUnit;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TOrderedPolygonForm, OrderedPolygonForm);
  Application.Run;
end.

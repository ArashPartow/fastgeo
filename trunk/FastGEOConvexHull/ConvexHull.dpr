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


program ConvexHull;

uses
  Forms,
  ConvexHullFrm,
  ConvexHullUnit;

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Convex Hull - By Arash Partow';
  Application.CreateForm(TConvexHullForm, ConvexHullForm);
  Application.Run;
end.

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



program BarycentricDemo;

uses
  Forms,
  BarycentricDemoForm;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TBarycentricForm, BarycentricForm);
  Application.Run;
end.

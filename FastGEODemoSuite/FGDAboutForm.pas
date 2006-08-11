(*************************************************************************)
(*                                                                       *)
(*                  FastGEO Demonstration Suite                          *)
(* File: FGDAboutForm                                                    *)
(* Purpose: About box dialog                                             *)
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


unit FGDAboutForm;

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
   ExtCtrls,
   Buttons;

type
  TFDGAboutForm = class(TForm)
    OKButton    : TBitBtn;
    Bevel1      : TBevel;
    Bevel2      : TBevel;
    StaticText1 : TStaticText;
    StaticText2 : TStaticText;
    StaticText3 : TStaticText;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDGAboutForm : TFDGAboutForm;

implementation

{$R *.dfm}

end.

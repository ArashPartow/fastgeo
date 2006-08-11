(*************************************************************************)
(*                                                                       *)
(*                  FastGEO Demonstration Suite                          *)
(* File: FGDReleaseNotesForm                                             *)
(* Purpose: Release notes                                                *)
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

unit FGDReleaseNotes;

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
   Buttons,
   ExtCtrls;

const ReleaseNotes : String = 'Not all functionalities have been properly implemented at this point in time.' + #13 + #10 +
                              '- Arash (2005)'                                                                + #13 + #10 +
                              ''                                                                              + #13 + #10;


type
  TFGDReleaseNotesForm = class(TForm)
    Memo    : TMemo;
    BitBtn  : TBitBtn;
    Bevel1  : TBevel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGDReleaseNotesForm: TFGDReleaseNotesForm;

implementation

{$R *.dfm}

procedure TFGDReleaseNotesForm.FormCreate(Sender: TObject);
begin
 Memo.Lines.Add(ReleaseNotes);
end;

end.

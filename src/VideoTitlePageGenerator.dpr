(* C2PP
  ***************************************************************************

  Video Title Page Generator

  Copyright 2022-2025 Patrick PREMARTIN under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://videotitlepagegenerator.olfsoftware.fr

  Project site :
  https://github.com/DeveloppeurPascal/Video-Title-Page-Generator

  ***************************************************************************
  File last update : 2025-10-16T10:43:29.661+02:00
  Signature : a5062ea3c2356434da5b01b39ef89fff2c4715e5
  ***************************************************************************
*)

program VideoTitlePageGenerator;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  Olf.FMX.TextImageFrame in '..\lib-externes\librairies\Olf.FMX.TextImageFrame.pas' {OlfFMXTextImageFrame: TFrame},
  Olf.RTL.Params in '..\lib-externes\librairies\Olf.RTL.Params.pas',
  udmAdobeStock_40061010 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_40061010\udmAdobeStock_40061010.pas' {dmAdobeStock_40061010: TDataModule},
  udmAdobeStock_46980088 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_46980088\udmAdobeStock_46980088.pas' {dmAdobeStock_46980088: TDataModule},
  udmAdobeStock_167085034 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_167085034\udmAdobeStock_167085034.pas' {dmAdobeStock_167085034: TDataModule},
  udmAdobeStock_186670253 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_186670253\udmAdobeStock_186670253.pas' {dmAdobeStock_186670253: TDataModule},
  udmAdobeStock_186670282 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_186670282\udmAdobeStock_186670282.pas' {dmAdobeStock_186670282: TDataModule},
  udmAdobeStock_186670296 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_186670296\udmAdobeStock_186670296.pas' {dmAdobeStock_186670296: TDataModule},
  udmAdobeStock_189329708 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_189329708\udmAdobeStock_189329708.pas' {dmAdobeStock_189329708: TDataModule},
  udmAdobeStock_192579903 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_192579903\udmAdobeStock_192579903.pas' {dmAdobeStock_192579903: TDataModule},
  udmAdobeStock_222453524 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_222453524\udmAdobeStock_222453524.pas' {dmAdobeStock_222453524: TDataModule},
  udmAdobeStock_244544528 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_244544528\udmAdobeStock_244544528.pas' {dmAdobeStock_244544528: TDataModule},
  udmAdobeStock_246405445_246405544 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_246405445_246405544\udmAdobeStock_246405445_246405544.pas' {dmAdobeStock_246405445_246405544: TDataModule},
  udmAdobeStock_257147901 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_257147901\udmAdobeStock_257147901.pas' {dmAdobeStock_257147901: TDataModule},
  udmAdobeStock_280392106 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_280392106\udmAdobeStock_280392106.pas' {dmAdobeStock_280392106: TDataModule},
  udmAdobeStock_286917767 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_286917767\udmAdobeStock_286917767.pas' {dmAdobeStock_286917767: TDataModule},
  udmAdobeStock_289867867 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_289867867\udmAdobeStock_289867867.pas' {dmAdobeStock_289867867: TDataModule},
  udmAdobeStock_310821053 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_310821053\udmAdobeStock_310821053.pas' {dmAdobeStock_310821053: TDataModule},
  udmAdobeStock_320378488 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_320378488\udmAdobeStock_320378488.pas' {dmAdobeStock_320378488: TDataModule},
  udmAdobeStock_356108946 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_356108946\udmAdobeStock_356108946.pas' {dmAdobeStock_356108946: TDataModule},
  udmAdobeStock_377613666 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_377613666\udmAdobeStock_377613666.pas' {dmAdobeStock_377613666: TDataModule},
  udmAdobeStock_385761409 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_385761409\udmAdobeStock_385761409.pas' {dmAdobeStock_385761409: TDataModule},
  udmAdobeStock_406985673 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_406985673\udmAdobeStock_406985673.pas' {dmAdobeStock_406985673: TDataModule},
  udmAdobeStock_410478488 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_410478488\udmAdobeStock_410478488.pas' {dmAdobeStock_410478488: TDataModule},
  udmAdobeStock_422293951 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_422293951\udmAdobeStock_422293951.pas' {dmAdobeStock_422293951: TDataModule},
  udmAdobeStock_527809947 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_527809947\udmAdobeStock_527809947.pas' {dmAdobeStock_527809947: TDataModule},
  udmAdobeStock_526775911 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_526775911\udmAdobeStock_526775911.pas' {dmAdobeStock_526775911: TDataModule},
  udmAdobeStock_516713322 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_516713322\udmAdobeStock_516713322.pas' {dmAdobeStock_516713322: TDataModule},
  udmAdobeStock_497062500 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_497062500\udmAdobeStock_497062500.pas' {dmAdobeStock_497062500: TDataModule},
  udmAdobeStock_493845714 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_493845714\udmAdobeStock_493845714.pas' {dmAdobeStock_493845714: TDataModule},
  udmAdobeStock_487544607 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_487544607\udmAdobeStock_487544607.pas' {dmAdobeStock_487544607: TDataModule},
  udmAdobeStock_486513768 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_486513768\udmAdobeStock_486513768.pas' {dmAdobeStock_486513768: TDataModule},
  udmAdobeStock_473515870 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_473515870\udmAdobeStock_473515870.pas' {dmAdobeStock_473515870: TDataModule},
  udmAdobeStock_444672949 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_444672949\udmAdobeStock_444672949.pas' {dmAdobeStock_444672949: TDataModule},
  udmAdobeStock_442549583 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_442549583\udmAdobeStock_442549583.pas' {dmAdobeStock_442549583: TDataModule},
  udmAdobeStock_441972263 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_441972263\udmAdobeStock_441972263.pas' {dmAdobeStock_441972263: TDataModule},
  udmAdobeStock_440583506 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_440583506\udmAdobeStock_440583506.pas' {dmAdobeStock_440583506: TDataModule},
  udmAdobeStock_430117883 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_430117883\udmAdobeStock_430117883.pas' {dmAdobeStock_430117883: TDataModule},
  Olf.FMX.AboutDialog in '..\lib-externes\AboutDialog-Delphi-Component\sources\Olf.FMX.AboutDialog.pas',
  Olf.FMX.AboutDialogForm in '..\lib-externes\AboutDialog-Delphi-Component\sources\Olf.FMX.AboutDialogForm.pas' {OlfAboutDialogForm},
  u_urlOpen in '..\lib-externes\librairies\u_urlOpen.pas',
  udmAdobeStock_47191065bleu_gris in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_47191065-bleu_gris\udmAdobeStock_47191065bleu_gris.pas' {dmAdobeStock_47191065bleu_gris: TDataModule},
  udmAdobeStock_47191065orange_gris in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_47191065-orange_gris\udmAdobeStock_47191065orange_gris.pas' {dmAdobeStock_47191065orange_gris: TDataModule},
  udmAdobeStock_47191065orange_noir in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_47191065-orange_noir\udmAdobeStock_47191065orange_noir.pas' {dmAdobeStock_47191065orange_noir: TDataModule},
  udmAdobeStock_47191065vert_gris in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_47191065-vert_gris\udmAdobeStock_47191065vert_gris.pas' {dmAdobeStock_47191065vert_gris: TDataModule},
  udmAdobeStock_60051145_60102985 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_60051145_60102985\udmAdobeStock_60051145_60102985.pas' {dmAdobeStock_60051145_60102985: TDataModule},
  udmAdobeStock_72392519 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_72392519\udmAdobeStock_72392519.pas' {dmAdobeStock_72392519: TDataModule},
  udmAdobeStock_79610991 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_79610991\udmAdobeStock_79610991.pas' {dmAdobeStock_79610991: TDataModule},
  udmAdobeStock_101337396 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_101337396\udmAdobeStock_101337396.pas' {dmAdobeStock_101337396: TDataModule},
  udmAdobeStock_102804804 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_102804804\udmAdobeStock_102804804.pas' {dmAdobeStock_102804804: TDataModule},
  udmAdobeStock_151096081 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_151096081\udmAdobeStock_151096081.pas' {dmAdobeStock_151096081: TDataModule},
  udmAdobeStock_159079012 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_159079012\udmAdobeStock_159079012.pas' {dmAdobeStock_159079012: TDataModule},
  udmAdobeStock_181197116 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_181197116\udmAdobeStock_181197116.pas' {dmAdobeStock_181197116: TDataModule},
  udmAdobeStock_212889779 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_212889779\udmAdobeStock_212889779.pas' {dmAdobeStock_212889779: TDataModule},
  udmAdobeStock_224288141 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_224288141\udmAdobeStock_224288141.pas' {dmAdobeStock_224288141: TDataModule},
  udmAdobeStock_238191796 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_238191796\udmAdobeStock_238191796.pas' {dmAdobeStock_238191796: TDataModule},
  udmAdobeStock_268229970 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_268229970\udmAdobeStock_268229970.pas' {dmAdobeStock_268229970: TDataModule},
  udmAdobeStock_268305761 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_268305761\udmAdobeStock_268305761.pas' {dmAdobeStock_268305761: TDataModule},
  udmAdobeStock_268788522 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_268788522\udmAdobeStock_268788522.pas' {dmAdobeStock_268788522: TDataModule},
  udmAdobeStock_296550198 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_296550198\udmAdobeStock_296550198.pas' {dmAdobeStock_296550198: TDataModule},
  udmAdobeStock_303523361 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_303523361\udmAdobeStock_303523361.pas' {dmAdobeStock_303523361: TDataModule},
  udmAdobeStock_308188160 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_308188160\udmAdobeStock_308188160.pas' {dmAdobeStock_308188160: TDataModule},
  udmAdobeStock_308188163 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_308188163\udmAdobeStock_308188163.pas' {dmAdobeStock_308188163: TDataModule},
  udmAdobeStock_320610939 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_320610939\udmAdobeStock_320610939.pas' {dmAdobeStock_320610939: TDataModule},
  udmAdobeStock_326331019 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_326331019\udmAdobeStock_326331019.pas' {dmAdobeStock_326331019: TDataModule},
  udmAdobeStock_386228735 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_386228735\udmAdobeStock_386228735.pas' {dmAdobeStock_386228735: TDataModule},
  udmAdobeStock_425420228 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_425420228\udmAdobeStock_425420228.pas' {dmAdobeStock_425420228: TDataModule},
  udmAdobeStock_460990606 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_460990606\udmAdobeStock_460990606.pas' {dmAdobeStock_460990606: TDataModule},
  udmAdobeStock_467305414 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_467305414\udmAdobeStock_467305414.pas' {dmAdobeStock_467305414: TDataModule},
  udmAdobeStock_467305422 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_467305422\udmAdobeStock_467305422.pas' {dmAdobeStock_467305422: TDataModule},
  udmAdobeStock_470511965 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_470511965\udmAdobeStock_470511965.pas' {dmAdobeStock_470511965: TDataModule},
  udmAdobeStock_472041748 in 'Y:\fontes-a-convertir-a-delphi\AdobeStock_472041748\udmAdobeStock_472041748.pas' {dmAdobeStock_472041748: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmAdobeStock_40061010, dmAdobeStock_40061010);
  Application.CreateForm(TdmAdobeStock_46980088, dmAdobeStock_46980088);
  Application.CreateForm(TdmAdobeStock_167085034, dmAdobeStock_167085034);
  Application.CreateForm(TdmAdobeStock_186670253, dmAdobeStock_186670253);
  Application.CreateForm(TdmAdobeStock_186670282, dmAdobeStock_186670282);
  Application.CreateForm(TdmAdobeStock_186670296, dmAdobeStock_186670296);
  Application.CreateForm(TdmAdobeStock_189329708, dmAdobeStock_189329708);
  Application.CreateForm(TdmAdobeStock_192579903, dmAdobeStock_192579903);
  Application.CreateForm(TdmAdobeStock_222453524, dmAdobeStock_222453524);
  Application.CreateForm(TdmAdobeStock_244544528, dmAdobeStock_244544528);
  Application.CreateForm(TdmAdobeStock_246405445_246405544, dmAdobeStock_246405445_246405544);
  Application.CreateForm(TdmAdobeStock_257147901, dmAdobeStock_257147901);
  Application.CreateForm(TdmAdobeStock_280392106, dmAdobeStock_280392106);
  Application.CreateForm(TdmAdobeStock_286917767, dmAdobeStock_286917767);
  Application.CreateForm(TdmAdobeStock_289867867, dmAdobeStock_289867867);
  Application.CreateForm(TdmAdobeStock_310821053, dmAdobeStock_310821053);
  Application.CreateForm(TdmAdobeStock_320378488, dmAdobeStock_320378488);
  Application.CreateForm(TdmAdobeStock_356108946, dmAdobeStock_356108946);
  Application.CreateForm(TdmAdobeStock_377613666, dmAdobeStock_377613666);
  Application.CreateForm(TdmAdobeStock_385761409, dmAdobeStock_385761409);
  Application.CreateForm(TdmAdobeStock_406985673, dmAdobeStock_406985673);
  Application.CreateForm(TdmAdobeStock_410478488, dmAdobeStock_410478488);
  Application.CreateForm(TdmAdobeStock_422293951, dmAdobeStock_422293951);
  Application.CreateForm(TdmAdobeStock_527809947, dmAdobeStock_527809947);
  Application.CreateForm(TdmAdobeStock_526775911, dmAdobeStock_526775911);
  Application.CreateForm(TdmAdobeStock_516713322, dmAdobeStock_516713322);
  Application.CreateForm(TdmAdobeStock_497062500, dmAdobeStock_497062500);
  Application.CreateForm(TdmAdobeStock_493845714, dmAdobeStock_493845714);
  Application.CreateForm(TdmAdobeStock_487544607, dmAdobeStock_487544607);
  Application.CreateForm(TdmAdobeStock_486513768, dmAdobeStock_486513768);
  Application.CreateForm(TdmAdobeStock_473515870, dmAdobeStock_473515870);
  Application.CreateForm(TdmAdobeStock_473515870, dmAdobeStock_473515870);
  Application.CreateForm(TdmAdobeStock_472041748, dmAdobeStock_472041748);
  Application.CreateForm(TdmAdobeStock_444672949, dmAdobeStock_444672949);
  Application.CreateForm(TdmAdobeStock_442549583, dmAdobeStock_442549583);
  Application.CreateForm(TdmAdobeStock_441972263, dmAdobeStock_441972263);
  Application.CreateForm(TdmAdobeStock_440583506, dmAdobeStock_440583506);
  Application.CreateForm(TdmAdobeStock_430117883, dmAdobeStock_430117883);
  Application.CreateForm(TdmAdobeStock_47191065bleu_gris, dmAdobeStock_47191065bleu_gris);
  Application.CreateForm(TdmAdobeStock_47191065orange_gris, dmAdobeStock_47191065orange_gris);
  Application.CreateForm(TdmAdobeStock_47191065orange_noir, dmAdobeStock_47191065orange_noir);
  Application.CreateForm(TdmAdobeStock_47191065vert_gris, dmAdobeStock_47191065vert_gris);
  Application.CreateForm(TdmAdobeStock_60051145_60102985, dmAdobeStock_60051145_60102985);
  Application.CreateForm(TdmAdobeStock_72392519, dmAdobeStock_72392519);
  Application.CreateForm(TdmAdobeStock_79610991, dmAdobeStock_79610991);
  Application.CreateForm(TdmAdobeStock_101337396, dmAdobeStock_101337396);
  Application.CreateForm(TdmAdobeStock_102804804, dmAdobeStock_102804804);
  Application.CreateForm(TdmAdobeStock_151096081, dmAdobeStock_151096081);
  Application.CreateForm(TdmAdobeStock_159079012, dmAdobeStock_159079012);
  Application.CreateForm(TdmAdobeStock_181197116, dmAdobeStock_181197116);
  Application.CreateForm(TdmAdobeStock_212889779, dmAdobeStock_212889779);
  Application.CreateForm(TdmAdobeStock_224288141, dmAdobeStock_224288141);
  Application.CreateForm(TdmAdobeStock_238191796, dmAdobeStock_238191796);
  Application.CreateForm(TdmAdobeStock_268229970, dmAdobeStock_268229970);
  Application.CreateForm(TdmAdobeStock_268305761, dmAdobeStock_268305761);
  Application.CreateForm(TdmAdobeStock_268788522, dmAdobeStock_268788522);
  Application.CreateForm(TdmAdobeStock_296550198, dmAdobeStock_296550198);
  Application.CreateForm(TdmAdobeStock_303523361, dmAdobeStock_303523361);
  Application.CreateForm(TdmAdobeStock_308188160, dmAdobeStock_308188160);
  Application.CreateForm(TdmAdobeStock_308188163, dmAdobeStock_308188163);
  Application.CreateForm(TdmAdobeStock_320610939, dmAdobeStock_320610939);
  Application.CreateForm(TdmAdobeStock_326331019, dmAdobeStock_326331019);
  Application.CreateForm(TdmAdobeStock_386228735, dmAdobeStock_386228735);
  Application.CreateForm(TdmAdobeStock_425420228, dmAdobeStock_425420228);
  Application.CreateForm(TdmAdobeStock_460990606, dmAdobeStock_460990606);
  Application.CreateForm(TdmAdobeStock_467305414, dmAdobeStock_467305414);
  Application.CreateForm(TdmAdobeStock_467305422, dmAdobeStock_467305422);
  Application.CreateForm(TdmAdobeStock_470511965, dmAdobeStock_470511965);
  Application.CreateForm(TdmAdobeStock_472041748, dmAdobeStock_472041748);
  Application.Run;

end.

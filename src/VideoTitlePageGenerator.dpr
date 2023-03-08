program VideoTitlePageGenerator;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  Olf.FMX.TextImageFrame in '..\lib-externes\librairies\Olf.FMX.TextImageFrame.pas' {OlfFMXTextImageFrame: TFrame},
  Olf.RTL.Params in '..\lib-externes\librairies\Olf.RTL.Params.pas',
  udmAdobeStock_40061010 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_40061010\udmAdobeStock_40061010.pas' {dmAdobeStock_40061010: TDataModule},
  udmAdobeStock_46980088 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_46980088\udmAdobeStock_46980088.pas' {dmAdobeStock_46980088: TDataModule},
  udmAdobeStock_167085034 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_167085034\udmAdobeStock_167085034.pas' {dmAdobeStock_167085034: TDataModule},
  udmAdobeStock_186670253 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_186670253\udmAdobeStock_186670253.pas' {dmAdobeStock_186670253: TDataModule},
  udmAdobeStock_186670282 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_186670282\udmAdobeStock_186670282.pas' {dmAdobeStock_186670282: TDataModule},
  udmAdobeStock_186670296 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_186670296\udmAdobeStock_186670296.pas' {dmAdobeStock_186670296: TDataModule},
  udmAdobeStock_189329708 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_189329708\udmAdobeStock_189329708.pas' {dmAdobeStock_189329708: TDataModule},
  udmAdobeStock_192579903 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_192579903\udmAdobeStock_192579903.pas' {dmAdobeStock_192579903: TDataModule},
  udmAdobeStock_222453524 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_222453524\udmAdobeStock_222453524.pas' {dmAdobeStock_222453524: TDataModule},
  udmAdobeStock_244544528 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_244544528\udmAdobeStock_244544528.pas' {dmAdobeStock_244544528: TDataModule},
  udmAdobeStock_246405445_246405544 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_246405445_246405544\udmAdobeStock_246405445_246405544.pas' {dmAdobeStock_246405445_246405544: TDataModule},
  udmAdobeStock_257147901 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_257147901\udmAdobeStock_257147901.pas' {dmAdobeStock_257147901: TDataModule},
  udmAdobeStock_280392106 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_280392106\udmAdobeStock_280392106.pas' {dmAdobeStock_280392106: TDataModule},
  udmAdobeStock_286917767 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_286917767\udmAdobeStock_286917767.pas' {dmAdobeStock_286917767: TDataModule},
  udmAdobeStock_289867867 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_289867867\udmAdobeStock_289867867.pas' {dmAdobeStock_289867867: TDataModule},
  udmAdobeStock_310821053 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_310821053\udmAdobeStock_310821053.pas' {dmAdobeStock_310821053: TDataModule},
  udmAdobeStock_320378488 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_320378488\udmAdobeStock_320378488.pas' {dmAdobeStock_320378488: TDataModule},
  udmAdobeStock_356108946 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_356108946\udmAdobeStock_356108946.pas' {dmAdobeStock_356108946: TDataModule},
  udmAdobeStock_377613666 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_377613666\udmAdobeStock_377613666.pas' {dmAdobeStock_377613666: TDataModule},
  udmAdobeStock_385761409 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_385761409\udmAdobeStock_385761409.pas' {dmAdobeStock_385761409: TDataModule},
  udmAdobeStock_406985673 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_406985673\udmAdobeStock_406985673.pas' {dmAdobeStock_406985673: TDataModule},
  udmAdobeStock_410478488 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_410478488\udmAdobeStock_410478488.pas' {dmAdobeStock_410478488: TDataModule},
  udmAdobeStock_422293951 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_422293951\udmAdobeStock_422293951.pas' {dmAdobeStock_422293951: TDataModule},
  udmAdobeStock_527809947 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_527809947\udmAdobeStock_527809947.pas' {dmAdobeStock_527809947: TDataModule},
  udmAdobeStock_526775911 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_526775911\udmAdobeStock_526775911.pas' {dmAdobeStock_526775911: TDataModule},
  udmAdobeStock_516713322 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_516713322\udmAdobeStock_516713322.pas' {dmAdobeStock_516713322: TDataModule},
  udmAdobeStock_497062500 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_497062500\udmAdobeStock_497062500.pas' {dmAdobeStock_497062500: TDataModule},
  udmAdobeStock_493845714 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_493845714\udmAdobeStock_493845714.pas' {dmAdobeStock_493845714: TDataModule},
  udmAdobeStock_487544607 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_487544607\udmAdobeStock_487544607.pas' {dmAdobeStock_487544607: TDataModule},
  udmAdobeStock_486513768 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_486513768\udmAdobeStock_486513768.pas' {dmAdobeStock_486513768: TDataModule},
  udmAdobeStock_473515870 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_473515870\udmAdobeStock_473515870.pas' {dmAdobeStock_473515870: TDataModule},
  udmAdobeStock_472041748 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_472041748\udmAdobeStock_472041748.pas' {dmAdobeStock_472041748: TDataModule},
  udmAdobeStock_444672949 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_444672949\udmAdobeStock_444672949.pas' {dmAdobeStock_444672949: TDataModule},
  udmAdobeStock_442549583 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_442549583\udmAdobeStock_442549583.pas' {dmAdobeStock_442549583: TDataModule},
  udmAdobeStock_441972263 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_441972263\udmAdobeStock_441972263.pas' {dmAdobeStock_441972263: TDataModule},
  udmAdobeStock_440583506 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_440583506\udmAdobeStock_440583506.pas' {dmAdobeStock_440583506: TDataModule},
  udmAdobeStock_430117883 in 'X:\fontes-a-convertir-a-delphi\AdobeStock_430117883\udmAdobeStock_430117883.pas' {dmAdobeStock_430117883: TDataModule};

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
  Application.Run;

end.

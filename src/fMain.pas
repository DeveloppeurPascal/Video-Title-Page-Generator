unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.ListBox, FMX.Controls.Presentation, FMX.Edit,
  System.ImageList, FMX.ImgList, FMX.StdCtrls, FMX.Objects,
  Olf.FMX.TextImageFrame, FMX.Layouts, FMX.Menus, Olf.FMX.AboutDialog;

type
  TfrmMain = class(TForm)
    edtTitleFilePath: TEdit;
    edtExportFolderPath: TEdit;
    edtBackgroundImageFilePath: TEdit;
    cbFontList: TComboBox;
    mmoTitleList: TMemo;
    cbFontListPreview: TGlyph;
    btnExportTitlePages: TButton;
    MainMenu1: TMainMenu;
    OlfAboutDialog1: TOlfAboutDialog;
    mnufile: TMenuItem;
    mnuHelp: TMenuItem;
    mnuQuit: TMenuItem;
    mnuAbout: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure cbFontListChange(Sender: TObject);
    procedure edtTitleFilePathChange(Sender: TObject);
    procedure edtBackgroundImageFilePathChange(Sender: TObject);
    procedure edtExportFolderPathChange(Sender: TObject);
    procedure btnExportTitlePagesClick(Sender: TObject);
    procedure mnuQuitClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure OlfAboutDialog1URLClick(const AURL: string);
  private
    { Déclarations privées }
    procedure CreationDifferee;
    procedure InitFontList;
    function getImageList(DMFont: TDataModule): TImageList;
    procedure GenerateVideoTitlePages(titles: TStrings; Font: TCustomImageList;
      BackgroundImageFilePath, ExportFolderPath: string);
    function getConvertedCharImageIndex(Sender: TOlfFMXTextImageFrame;
      AChar: char): integer;
    function EnNomDeFichier(Texte: string; ID: integer): string;
    function FiltreTexte(Texte: string): string;
    procedure AjoutTexte(Texte: string; Font: TCustomImageList; L: TLayout;
      Y: single);
  public
    { Déclarations publiques }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  System.IOUtils, Olf.RTL.Params, System.Math, u_urlOpen;

procedure TfrmMain.AjoutTexte(Texte: string; Font: TCustomImageList; L: TLayout;
  Y: single);
var
  TextGraph: TOlfFMXTextImageFrame;
  nblig: integer;
  idx: integer;
begin
  TextGraph := TOlfFMXTextImageFrame.Create(L);
  TextGraph.Parent := L;
  TextGraph.Align := talignlayout.none;
  TextGraph.height := 100;
  TextGraph.OnGetImageIndexOfUnknowChar := getConvertedCharImageIndex;
  TextGraph.Font := Font;
  TextGraph.Text := Texte;
  TextGraph.position.X := (L.Width - TextGraph.Width) / 2;
  TextGraph.position.Y := Y;
  L.height := Y + TextGraph.height;
  if (L.Width < TextGraph.Width) then
  begin
    // nb lig minimum pour le texte dans la largeur de la zone d'affichage
    nblig := ceil(TextGraph.Width / L.Width);
    // recherche du premier espace à droite du texte
    idx := Texte.LastIndexOf(' ', Texte.length div nblig);
    // idx := Texte.length div nblig;
    // while (idx >= 0) and (Texte.Chars[idx] <> ' ') do
    // dec(idx);
    // recherche du premier espace à droite
    if (idx < 0) then
    begin
      idx := Texte.IndexOf(' ', Texte.length div nblig);
      // idx := Texte.length div nblig;
      // while (idx < Texte.length) and (Texte.Chars[idx] <> ' ') do
      // inc(idx);
    end;
    if (idx > 0) then
    begin
      TextGraph.Free;
      AjoutTexte(Texte.Substring(0, idx), Font, L, Y);
      Y := Y + 100 + 10;
      AjoutTexte(Texte.Substring(idx + 1), Font, L, Y);
    end;
  end;
end;

procedure TfrmMain.btnExportTitlePagesClick(Sender: TObject);
begin
  if (cbFontList.ItemIndex < 0) then
    raise exception.Create('Choose font before processing !');
  if edtTitleFilePath.Text.IsEmpty then
    edtTitleFilePathChange(edtTitleFilePath);
  if (mmoTitleList.Lines.Count < 1) then
    raise exception.Create('No video title in the list.');
  if edtBackgroundImageFilePath.Text.IsEmpty then
    edtBackgroundImageFilePathChange(edtBackgroundImageFilePath);
  if edtExportFolderPath.Text.IsEmpty then
    edtExportFolderPathChange(edtExportFolderPath);

  TParams.setValue('Fonte', cbFontList.ItemIndex);
  TParams.setValue('Textes', edtTitleFilePath.Text);
  TParams.setValue('Background', edtBackgroundImageFilePath.Text);
  TParams.setValue('Destination', edtExportFolderPath.Text);
  TParams.Save;

  GenerateVideoTitlePages(mmoTitleList.Lines,
    cbFontList.ListItems[cbFontList.ItemIndex].TagObject as TImageList,
    edtBackgroundImageFilePath.Text, edtExportFolderPath.Text);

  ShowMessage('Work done.');
end;

procedure TfrmMain.cbFontListChange(Sender: TObject);
begin
  if (cbFontList.ItemIndex < 0) then
    cbFontListPreview.Visible := false
  else if assigned(cbFontList.ListItems[cbFontList.ItemIndex].TagObject) and
    (cbFontList.ListItems[cbFontList.ItemIndex].TagObject is TImageList) then
  begin
    cbFontListPreview.Images := cbFontList.ListItems[cbFontList.ItemIndex]
      .TagObject as TImageList;
    cbFontListPreview.ImageIndex := 0;
    cbFontListPreview.Visible := true;
  end
  else
    cbFontListPreview.Visible := false;
end;

procedure TfrmMain.CreationDifferee;
begin
  mmoTitleList.Lines.Clear;

  InitFontList;

  cbFontList.ItemIndex := TParams.getValue('Fonte', 0);
  edtTitleFilePath.Text := TParams.getValue('Textes', edtTitleFilePath.Text);
  edtBackgroundImageFilePath.Text := TParams.getValue('Background',
    edtBackgroundImageFilePath.Text);
  edtExportFolderPath.Text := TParams.getValue('Destination',
    edtExportFolderPath.Text);
end;

procedure TfrmMain.edtBackgroundImageFilePathChange(Sender: TObject);
begin
  if edtBackgroundImageFilePath.Text.IsEmpty then
    raise exception.Create
      ('Veuillez indiquer le chemin vers l''image de background à utiliser.');
  if not tfile.Exists(edtBackgroundImageFilePath.Text) then
    raise exception.Create('Fichier introuvable');
end;

procedure TfrmMain.edtExportFolderPathChange(Sender: TObject);
begin
  if edtExportFolderPath.Text.IsEmpty then
    raise exception.Create
      ('Veuillez indiquer le chemin vers le dossier où seront créées les images.');
  if not tdirectory.Exists(edtExportFolderPath.Text) then
    raise exception.Create('Dossier introuvable');
end;

procedure TfrmMain.edtTitleFilePathChange(Sender: TObject);
begin
  if edtTitleFilePath.Text.IsEmpty then
    raise exception.Create
      ('Veuillez indiquer le chemin vers le fichier contenant les titres de vidéos.');
  if not tfile.Exists(edtTitleFilePath.Text) then
    raise exception.Create('Fichier introuvable');
  mmoTitleList.Lines.Clear;
  mmoTitleList.Lines.LoadFromFile(edtTitleFilePath.Text, tencoding.UTF8);
end;

function TfrmMain.EnNomDeFichier(Texte: string; ID: integer): string;
var
  i: integer;
  c: char;
begin
  result := '';
  for i := 0 to Texte.length - 1 do
  begin
    c := Texte.Chars[i];
    if (c = ' ') then
      result := result + '_'
    else if CharInSet(c, ['a' .. 'z', 'A' .. 'Z', '_', '-', '0' .. '9', '.'])
    then
      result := result + c
    else if CharInSet(c, ['à', 'â', 'ä']) then
      result := result + 'a'
    else if CharInSet(c, ['é', 'ê', 'è', 'ë']) then
      result := result + 'e'
    else if CharInSet(c, ['ï', 'î']) then
      result := result + 'e'
    else if CharInSet(c, ['ö', 'ô']) then
      result := result + 'o'
    else if CharInSet(c, ['ü', 'û', 'ù']) then
      result := result + 'u';
  end;
  if (result.IsEmpty) then
    result := ID.ToString;
end;

function TfrmMain.FiltreTexte(Texte: string): string;
begin
  result := Texte.Trim.Replace('  ', ' ', [rfReplaceAll]);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
{$IF Defined(MACOS)}
  mnufile.Visible := false; // élimine Fichier/Quitter déjà pris en charge
{$ENDIF}
  tthread.ForceQueue(nil,
    procedure
    begin
      CreationDifferee;
    end);
end;

procedure TfrmMain.GenerateVideoTitlePages(titles: TStrings;
Font: TCustomImageList; BackgroundImageFilePath, ExportFolderPath: string);
var
  img: timage;
  bmp: tbitmap;
  L: TLayout;
  ZoneTexte: TLayout;
  txt: string;
begin
  if (titles.Count < 1) then
    raise exception.Create('No titles in the list.');
  if (not assigned(Font)) then
    raise exception.Create('No font found.');
  if (not tfile.Exists(BackgroundImageFilePath)) then
    raise exception.Create('No background image file.');
  if (not tdirectory.Exists(ExportFolderPath)) then
    raise exception.Create('Destination directory doesn''t exist.');

  img := timage.Create(self);
  try
    img.Parent := self;
    for var i := 0 to titles.Count - 1 do
      if not titles[i].IsEmpty then
      begin
        img.Bitmap.LoadFromFile(BackgroundImageFilePath);
        // ShowMessage(img.Width.ToString + 'x' + img.height.ToString + ' ' +
        // img.Bitmap.Width.ToString + 'x' + img.Bitmap.height.ToString + 'x' +
        // img.Bitmap.BitmapScale.ToString);
        img.Width := img.Bitmap.Width / img.Bitmap.bitmapscale;
        img.height := img.Bitmap.height / img.Bitmap.bitmapscale;
        // ShowMessage(img.Width.ToString + 'x' + img.Height.ToString + ' ' +
        // img.Bitmap.Width.ToString + 'x' + img.Bitmap.height.ToString + 'x' +
        // img.Bitmap.bitmapscale.ToString);
        ZoneTexte := TLayout.Create(self);
        try
          ZoneTexte.Parent := img;
          if (false) then
          begin
{$REGION en haut de page }
            // zone d'affichage du tete en haut d'écran
            ZoneTexte.Align := talignlayout.top;
            // limitée à 400 pixels de haut
            ZoneTexte.height := 400;
{$ENDREGION}
          end;
          if (false) then
          begin
{$REGION en bas de page }
            // zone d'affichage du tete en bas d'écran
            ZoneTexte.Align := talignlayout.bottom;
            // limitée à 400 pixels de haut
            ZoneTexte.height := 400;
{$ENDREGION}
          end;
          if (true) then
          begin
{$REGION au centre de la page }
            // zone d'affichage sur tout le background
            ZoneTexte.Align := talignlayout.VertCenter;
            // limitée à 98% de la hauteur du background
            ZoneTexte.height := img.height * 0.98;
{$ENDREGION}
          end;
          L := TLayout.Create(self);
          try
            L.Parent := ZoneTexte;
            L.Align := talignlayout.center;
            // limites du texte généré :
            // => 98% de la largeur du background
            // => 100 pixels de haut maximum
            L.Width := img.Width * 0.98;
            L.height := 100;
            txt := FiltreTexte(titles[i]);
            AjoutTexte(txt, Font, L, 0);
            // Capture image
            // ShowMessage(img.Width.ToString + 'x' + img.Width.ToString + ' ' +
            // img.Bitmap.Width.ToString + 'x' + img.Bitmap.height.ToString + 'x'
            // + img.Bitmap.bitmapscale.ToString);
            bmp := img.MakeScreenshot;
            try
              // ShowMessage(bmp.Width.ToString + 'x' + bmp.height.ToString + 'x' +
              // bmp.BitmapScale.ToString);
              // if (bmp.BitmapScale <> 1) then
              // bmp.Resize(trunc(bmp.Width / bmp.BitmapScale),
              // trunc(bmp.height / bmp.BitmapScale));
              bmp.SaveToFile(tpath.combine(ExportFolderPath, EnNomDeFichier(txt,
                i) + '.jpg'));
            finally
              bmp.Free;
            end;
          finally
            L.Free;
          end;
        finally
          ZoneTexte.Free;
        end;
      end;
  finally
    img.Free;
  end;
end;

function TfrmMain.getConvertedCharImageIndex(Sender: TOlfFMXTextImageFrame;
AChar: char): integer;
begin
  result := -1;
  if (result < 0) and CharInSet(AChar, ['a' .. 'z']) then
    result := Sender.getImageIndexOfChar('_' + AChar);
  if (result < 0) and CharInSet(AChar, ['a' .. 'z']) then
    result := Sender.getImageIndexOfChar(chr(ord('A') + ord(AChar) - ord('a')));
  if (result < 0) and (AChar = '?') then
    result := Sender.getImageIndexOfChar('interrogation');
  if (result < 0) and (AChar = '$') then
    result := Sender.getImageIndexOfChar('dollar');
  if (result < 0) and (AChar = '!') then
    result := Sender.getImageIndexOfChar('exclamation');
  if (result < 0) and (AChar = '&') then
    result := Sender.getImageIndexOfChar('et');
  if (result < 0) and (AChar = '%') then
    result := Sender.getImageIndexOfChar('pourcent');
  if (result < 0) and (AChar = '''') then
    result := Sender.getImageIndexOfChar('apostrophe');
  if (result < 0) and (AChar = ',') then
    result := Sender.getImageIndexOfChar('virgule');
  if (result < 0) and (AChar = '=') then
    result := Sender.getImageIndexOfChar('egale');
  if (result < 0) and (AChar = '-') then
    result := Sender.getImageIndexOfChar('moins');
  if (result < 0) and (AChar = '+') then
    result := Sender.getImageIndexOfChar('plus');
  if (result < 0) and (AChar = 'à') then
    result := Sender.getImageIndexOfChar('_agrave');
  if (result < 0) and (AChar = 'à') then
    result := getConvertedCharImageIndex(Sender, 'a');
  if (result < 0) and (AChar = 'é') then
    result := Sender.getImageIndexOfChar('_eaigu');
  if (result < 0) and (AChar = 'è') then
    result := Sender.getImageIndexOfChar('_egrave');
  if (result < 0) and (AChar = 'ê') then
    result := Sender.getImageIndexOfChar('_ecirconflexe');
  if (result < 0) and (AChar = 'ë') then
    result := Sender.getImageIndexOfChar('_etrema');
  if (result < 0) and CharInSet(AChar, ['é', 'è', 'ê', 'ë']) then
    result := getConvertedCharImageIndex(Sender, 'e');
  if (result < 0) and (AChar = 'ô') then
    result := Sender.getImageIndexOfChar('_ocirconflexe');
  if (result < 0) and (AChar = 'ö') then
    result := Sender.getImageIndexOfChar('_otrema');
  if (result < 0) and CharInSet(AChar, ['ô', 'ö']) then
    result := getConvertedCharImageIndex(Sender, 'o');
  if (result < 0) and (AChar = 'î') then
    result := Sender.getImageIndexOfChar('_icirconflexe');
  if (result < 0) and (AChar = 'ï') then
    result := Sender.getImageIndexOfChar('_itrema');
  if (result < 0) and CharInSet(AChar, ['î', 'ï']) then
    result := getConvertedCharImageIndex(Sender, 'i');
  if (result < 0) and (AChar = 'û') then
    result := Sender.getImageIndexOfChar('_ucirconflexe');
  if (result < 0) and (AChar = 'ü') then
    result := Sender.getImageIndexOfChar('_utrema');
  if (result < 0) and (AChar = 'ù') then
    result := Sender.getImageIndexOfChar('_ugrave');
  // if (result < 0) and (AChar = '') then // TODO : ajouter u aigu
  // result := Sender.getImageIndexOfChar('_uaigu');
  if (result < 0) and CharInSet(AChar, ['û', 'ü', 'ù']) then
    // TODO : ajouter u aigu
    result := getConvertedCharImageIndex(Sender, 'u');
  if (result < 0) and (AChar = 'oe') then
    result := Sender.getImageIndexOfChar('_oe');
  // TODO : récupérer "oe" en minuscules
  if (result < 0) and (AChar = 'OE') then
    result := Sender.getImageIndexOfChar('OE');
  // TODO : récupérer "oe" en majuscules
  // if (result < 0) and (AChar = '...') then
  // TODO : récupérer points de suspensions en 1 caractère
  // result := Sender.getImageIndexOfChar('suspension'); // TODO
  if (result < 0) and (AChar = '.') then
    result := Sender.getImageIndexOfChar('point');
  if (result < 0) and (AChar = ':') then
    result := Sender.getImageIndexOfChar('deuxpoint');
  if (result < 0) and (AChar = ':') then
    result := Sender.getImageIndexOfChar('deux-point');
  if (result < 0) and (AChar = ';') then
    result := Sender.getImageIndexOfChar('pointvirgule');
  if (result < 0) and (AChar = ';') then
    result := Sender.getImageIndexOfChar('point-virgule');
  if (result < 0) and CharInSet(AChar, ['.', ',', ';', ':', '!', '''']) then
    result := getConvertedCharImageIndex(Sender, ' ');
end;

function TfrmMain.getImageList(DMFont: TDataModule): TImageList;
begin
  if (DMFont.ComponentCount = 1) and (DMFont.Components[0] is TImageList) then
    result := DMFont.Components[0] as TImageList
  else
    result := nil;
end;

procedure TfrmMain.InitFontList;
var
  dm: TDataModule;
  s: string;
  item: tlistboxitem;
  il: TImageList;
begin
  cbFontList.Clear;
  if (application.ComponentCount > 0) then
    for var i := 0 to application.ComponentCount - 1 do
      if (application.Components[i] is TDataModule) then
      begin
        dm := application.Components[i] as TDataModule;
        s := dm.Name;
        if (s.StartsWith('dmAdobeStock_')) then
        begin
          il := getImageList(dm);
          if assigned(il) then
          begin
            item := tlistboxitem.Create(self);
            item.Text := dm.Name;
            item.TagObject := il;
            cbFontList.AddObject(item);
          end;
        end;
      end;
  if cbFontList.Items.Count > 0 then
    cbFontList.ItemIndex := 0;
end;

procedure TfrmMain.mnuAboutClick(Sender: TObject);
begin
  OlfAboutDialog1.Execute;
end;

procedure TfrmMain.mnuQuitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.OlfAboutDialog1URLClick(const AURL: string);
begin
  url_Open_In_Browser(AURL);
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;

TParams.setFolderName(tpath.combine(tpath.combine(tpath.GetDocumentsPath,
  'OlfSoftware-debug'), 'VideoTitlePageGenerator-debug'));
{$ELSE}
  TParams.setFolderName(tpath.combine(tpath.combine(tpath.GetHomePath,
  'OlfSoftware'), 'VideoTitlePageGenerator'));
{$ENDIF}

end.

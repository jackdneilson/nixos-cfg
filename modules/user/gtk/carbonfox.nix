{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  sassc,
  gnome-themes-extra,
  gtk-engine-murrine
}:

let
  pname = "carbonfox-gtk-theme";
in

stdenvNoCC.mkDerivation {
  inherit pname;
  version = "0-unstable-2024-11-12";
  src = fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Nightfox-GTK-Theme";
    rev = "d9534b5275eb4bc588890c7bd8b30cf2b535c8e0";
    hash = "sha256-VVro8kkQisLkTyQVIBDSf55Qfnwb85glWOYWVfJbueI=";
  };

  propagatedUserEnvPkgs = [ gtk-engine-murrine ];

  nativeBuildInputs = [ sassc ];
  buildInputs = [ gnome-themes-extra];

  dontBuild = true;

  postPatch = ''
    patchShebangs themes/install.sh
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/themes
    cd themes
    ./install.sh -n Carbonfox -c dark --tweaks carbon black -d "$out/share/themes"
    runHook postInstall
  '';

  meta = with lib; {
    description = "A GTK theme based on the Carbonfox colour palette";
    homepage = "https://github.com/Fausto-Korpsvart/Nightfox-GTK-Theme";
    license = licenses.agpl3Plus;
    maintainers = with maintainers; [ onlylambs ];
    platforms = platforms.unix;
  };
}

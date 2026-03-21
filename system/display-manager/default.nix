{ pkgs, ... }:

let
  customWallpaper = ./background.jpg;
  mainColor = "#e8e8e8";
  accentColor = "#b4b4b4";
  placeholderColor = "#ffffff";

  sddm-personal = pkgs.stdenvNoCC.mkDerivation {
    pname = "sddm-personal";
    version = "1.0";

    src = pkgs.fetchFromGitHub {
      owner = "kamack38";
      repo = "sddm-greenleaf";
      rev = "main";
      sha256 = "sha256-AGcC7nlrW13dRVVHtgl6+vvnM1feXU/xPhntpfYWY9Y=";
    };

    installPhase = ''
      mkdir -p $out/share/sddm/themes/sddm-personal
      cp -aR . $out/share/sddm/themes/sddm-personal

      cp -f ${customWallpaper} $out/share/sddm/themes/sddm-personal/background.png

      sed -i "s/^MainColor=.*/MainColor=\"${mainColor}\"/" $out/share/sddm/themes/sddm-personal/theme.conf
      sed -i "s/^AccentColor=.*/AccentColor=\"${accentColor}\"/" $out/share/sddm/themes/sddm-personal/theme.conf
      sed -i "s/^PlaceholderColor=.*/PlaceholderColor=\"${placeholderColor}\"/" $out/share/sddm/themes/sddm-personal/theme.conf
    '';
  };
in
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-personal";
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs.kdePackages; [
      qt5compat
      qtdeclarative
      qtsvg
    ];
    settings.Theme.CursorTheme = "Quintom_Ink";
  };

  environment.systemPackages = [ sddm-personal ];
}

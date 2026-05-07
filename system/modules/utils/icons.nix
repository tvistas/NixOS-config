{ pkgs, ... }:

{
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    colloid-gtk-theme
    colloid-icon-theme
    quintom-cursor-theme
    noto-fonts
  ];

  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/gnome/desktop/interface" = {
          gtk-theme = "Colloid-Light";
          icon-theme = "Colloid-Light";
          cursor-theme = "Quintom_Ink";
        };
      };
    }
  ];

  environment.variables = {
    XCURSOR_THEME = "Quintom_Ink";
    XCURSOR_SIZE = "24";
  };
}

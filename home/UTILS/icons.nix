{ pkgs, ... }:

{
  gtk = {
    gtk4.theme = null;
    enable = true;
    theme = {
      package = pkgs.colloid-gtk-theme;
      name = "Colloid-Light";
    };

    iconTheme = {
      package = pkgs.colloid-icon-theme;
      name = "Colloid-Light";
    };
  };
}

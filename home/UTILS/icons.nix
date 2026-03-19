{ pkgs, ... }:

{
  gtk = {
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

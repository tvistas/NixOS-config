{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "zen-beta";
    TERMINAL = "ghostty";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
  };
}

{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    sioyek
    slack
  ];

  programs.onlyoffice = {
    enable = true;
  };
  programs.discord = {
    enable = true;
  };
  programs.obs-studio = {
    enable = true;
  };
  programs.element-desktop = {
    enable = true;
  };
}

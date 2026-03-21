{ pkgs, ... }:

{
  home.packages = with pkgs; [
    slack
    prismlauncher
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

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    slack
    prismlauncher
    thunderbird
    mpv
    nautilus
  ];

  programs.onlyoffice = {
    enable = true;
  };
  programs.vesktop = {
    enable = true;
  };
  programs.obs-studio = {
    enable = true;
  };
  programs.element-desktop = {
    enable = true;
  };
}

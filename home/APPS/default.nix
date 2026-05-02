{ pkgs, ... }:

{
  home.packages = with pkgs; [
    slack
    prismlauncher
    thunderbird
    mpv
    nautilus
    localsend
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
  programs.zathura = {
    enable = true;
  };
}

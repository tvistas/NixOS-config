{ config, pkgs, lib, ...}:

{
  home.packages = with pkgs; [
    wl-clipboard
  ];
  services.clipse = {
    enable = true;
  };
}

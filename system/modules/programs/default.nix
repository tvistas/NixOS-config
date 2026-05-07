{ inputs, pkgs, ... }:

{
  imports = [
    ./yazi.nix
  ];

  environment.systemPackages = with pkgs; [
    onlyoffice-desktopeditors
    zathura
    discord
    slack
    prismlauncher
    mpv
    nautilus
    kitty
    clipse
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.vicinae.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.steam.enable = false;
  programs.thunderbird.enable = true;
  programs.localsend.enable = true;
  programs.obs-studio.enable = true;
}

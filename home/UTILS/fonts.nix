{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    inter
    fira-code
    nerd-fonts.symbols-only
  ];

}

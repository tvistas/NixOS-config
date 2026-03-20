{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    inter
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
  ];

}

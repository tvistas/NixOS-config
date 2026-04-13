{ pkgs, ... }:

{
  extraPlugins = [
    pkgs.vimPlugins."tabout-nvim"
  ];
}

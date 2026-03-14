{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./flash.nix
    ./yazi.nix
    ./telescope.nix
    ./treesitter.nix
    ./autopairs.nix
    ./marks.nix
    ./arrow.nix
  ];
}

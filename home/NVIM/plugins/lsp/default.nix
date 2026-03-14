{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./lsp.nix
    ./conform.nix
    ./completion.nix
    ./fidget.nix
    ./marks.nix
  ];
}

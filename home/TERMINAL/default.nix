{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    fastfetch
    fzf
    ripgrep
    gh
  ];

  imports = [
    ./git.nix
    ./ghostty.nix
    ./bash.nix
    ./zellij.nix
    ./ssh.nix
  ];
}

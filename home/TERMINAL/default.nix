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
    sshfs
    lazygit
    trash-cli
  ];

  imports = [
    ./git.nix
    ./ghostty.nix
    ./zsh.nix
    ./zellij.nix
    ./ssh.nix
  ];
}

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    fzf
    htop
    ripgrep
    gh
    sshfs
    lazygit
    trash-cli
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        nix-search-tv
      ];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    })
  ];

  imports = [
    ./git.nix
    ./kitty.nix
    ./zsh.nix
    ./ssh.nix
    ./zoxide.nix
  ];
}

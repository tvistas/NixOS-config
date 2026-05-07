{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    inter
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
  ];

  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/gnome/desktop/interface" = {
          font-name = "Inter 11";
          document-font-name = "Inter 11";
          monospace-font-name = "FiraCode Nerd Font Mono 11";
        };
      };
    }
  ];
}

{ config, ... }:

{
  xdg.configFile."zellij/layouts/pic.kdl".source =
    config.lib.file.mkOutOfStoreSymlink "/home/tvistas/.nixos-config/home/ZELLIJ/pic.kdl";

  programs.zellij = {
    enable = true;
    settings = {
      theme = "vague";
      show_startup_tips = false;
      keybinds = import ./binds.nix;
    };

    themes.vague = import ./theme.nix;

  };
}

{ config, ... }:

{
  xdg.configFile."zellij/layouts/pic.kdl".source =
    config.lib.file.mkOutOfStoreSymlink "/home/tvistas/.nixos-config/home/ZELLIJ/layouts/pic.kdl";
  xdg.configFile."zellij/layouts/website.kdl".source =
    config.lib.file.mkOutOfStoreSymlink "/home/tvistas/.nixos-config/home/ZELLIJ/layouts/website.kdl";

  programs.zellij = {
    enable = true;
    settings = {
      theme = "vague";
      show_startup_tips = false;
      pane_frames = false;
      hide_session_name = true;
      keybinds = import ./binds.nix;
    };

    themes.vague = import ./theme.nix;

  };
}

{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "vague";
      show_startup_tips = false;
    };

    themes.vague = import ./theme.nix;

    xdg.configFile."zellij/layouts/pic.kdl" = ./pic.kdl;
  };
}

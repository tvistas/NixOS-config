{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "vague";
      show_startup_tips = false;
    };

    themes.vague = builtins.readFile ./theme.nix;
  };
}

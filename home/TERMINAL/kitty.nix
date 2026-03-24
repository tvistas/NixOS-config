{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    shellIntegration.mode = "no-cursor";

    font = {
      name = "FiraCode Nerd Font";
      size = 13;
    };

    settings = {
      enable_audio_bell = false;
      cursor = "#ebebeb";
      cursor_shape = "block";
      cursor_beam_thickness = 1.2;

      window_margin_width = 2;
      tab_bar_edge = "top";
    };

    themeFile = "vague";
  };
}

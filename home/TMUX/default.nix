{ pkgs, ... }:

let
  tmuxModal = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-modal";
    version = "main";
    src = pkgs.fetchFromGitHub {
      owner = "whame";
      repo = "tmux-modal";
      rev = "main";
      hash = pkgs.lib.fakeHash;
    };
  };

  vagueTheme = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "vague-tmux";
    version = "main";
    src = pkgs.fetchFromGitHub {
      owner = "vague-theme";
      repo = "vague-tmux";
      rev = "main";
      hash = pkgs.lib.fakeHash;
    };
  };
in
{
  programs.tmux = {
    enable = true;

    mouse = true;

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60'
        '';
      }

      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank

      tmuxModal
      vagueTheme
    ];
  };
}

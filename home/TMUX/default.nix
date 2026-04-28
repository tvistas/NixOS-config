{ pkgs, ... }:

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
    ];

    extraConfig = ''
      source-file ~/.config/tmux/vague.conf

      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'whame/tmux-modal'

      run '~/.tmux/plugins/tpm/tpm'
    '';
  };
}

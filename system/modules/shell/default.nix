{ deviceName, pkgs, ... }:

{
  environment = {
    pathsToLink = [ "/share/zsh" ];
    variables = {
      BROWSER = "zen-beta";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    systemPackages = with pkgs; [
      wl-clipboard
      python3
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
      git
    ];
  };

  programs.ssh.startAgent = true;
  programs.zoxide.enable = true;

  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake /home/tvistas/.nixos-config/#${deviceName}";
      lg = "lazygit";
      update = "sudo nix flake update --flake /home/tvistas/.nixos-config/";
    };

    ohMyZsh = {
      enable = true;
      theme = "murilasso";
    };

    shellInit = ''
      y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        command yazi "$@" --cwd-file="$tmp"
        IFS= read -r -d \'\' cwd < "$tmp"
        [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
        rm -f -- "$tmp"
      }

      ncg() {
        if [[ "$1" == "-g" && "$2" =~ ^[0-9]+$ ]]; then
            echo "Keeping the last $2 generations..."
            sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations "+$2"
            sudo nix-collect-garbage
            
        elif [[ "$1" == "-g" ]]; then
            echo "Error: You must provide a valid number."
            echo "Usage: ncg [-g <number>]"
            return 1
            
        else
            echo "Deleting all old generations..."
            sudo nix-collect-garbage -d
        fi
      }

      develop() {
        local flake_path="/home/tvistas/.nixos-config"
        
        if [[ -z "$1" ]]; then
          echo "Error: No shell found"
          return 1
        else
          echo "Loading '$1' devShell..."
          nix develop "$flake_path#$1" -c zsh
        fi
      }
    '';
  };

  programs.tmux = {
    enable = true;

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

      set -g mouse on
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'whame/tmux-modal'

      run '~/.tmux/plugins/tpm/tpm'
    '';
  };
}

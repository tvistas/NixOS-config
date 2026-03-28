{ deviceName, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake /home/tvistas/.nixos-config/#${deviceName}";
      lg = "lazygit";
    };

    sessionVariables = {
      BROWSER = "zen-beta";
      EDITOR = "nvim";
    };

    oh-my-zsh = {
      enable = true;
      theme = "murilasso";
    };

    initContent = ''
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

      z() {
        local LAYOUT_DIR="$HOME/.config/zellij/layouts"
        local layout_file=""
        local session_name=""
        local zellij_args=()

        while [[ "$#" -gt 0 ]]; do
            case $1 in
                -l) layout_file="$2"; shift 2 ;;
                -n) session_name="$2"; shift 2 ;;
                -h)
                    echo "Usage:"
                    echo "  z                       - Open default Zellij"
                    echo "  z -l <layout>           - Open Zellij with <layout>.kdl layout"
                    echo "  z -n <name>             - Open Zellij with session <name>"
                    echo "  z -n <name> -l <layout> - Open named session with specific layout"
                    return 0
                    ;;
                *)
                    echo "Error: Unknown flag $1"
                    return 1
                    ;;
            esac
        done

        if [[ -n "$session_name" ]]; then
            zellij_args+=(--session "$session_name")
            echo "Session name: $session_name"
        fi

        if [[ -n "$layout_file" ]]; then
            local LAYOUT_PATH="$LAYOUT_DIR/$layout_file.kdl"
            
            if [[ -f "$LAYOUT_PATH" ]]; then
                zellij_args+=(--layout "$LAYOUT_PATH")
                echo "Launching Zellij with layout: $layout_file"
            else
                echo "Error: Layout '$layout_file' not found at $LAYOUT_PATH"
                return 1
            fi
        fi

        zellij "''${zellij_args[@]}"
      }    
    '';
  };
}

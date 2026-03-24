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
          
          if [[ "$1" == "-l" && -n "$2" ]]; then
              local LAYOUT_PATH="$LAYOUT_DIR/$2.kdl"
              
              if [[ -f "$LAYOUT_PATH" ]]; then
                  echo "Launching Zellij with layout: $2"
                  zellij --new-session-with-layout "$LAYOUT_PATH"
              else
                  echo "Error: Layout '$2' not found"
                  return 1
              fi

          elif [[ "$1" == "-h" ]]; then
              echo "Usage:"
              echo "  z              - Open default Zellij"
              echo "  z -l <name>    - Open Zellij with <name>.kdl layout"
              return 0

          else
              zellij
          fi
      }
    '';
  };
}

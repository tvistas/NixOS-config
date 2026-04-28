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
      update = "sudo nix flake update --flake /home/tvistas/.nixos-config/";
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
}

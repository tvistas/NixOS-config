{
  environment.pathsToLink = [ "/share/zsh" ];
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake /home/tvistas/.nixos-config/";
      z = "zellij";
    };

    sessionVariables = {
      BROWSER = "zen-beta";
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
    '';
  };
}

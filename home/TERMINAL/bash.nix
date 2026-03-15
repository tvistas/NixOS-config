{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake /home/tvistas/.nixos-config/";
      z = "zellij";
    };
    sessionVariables = {
      BROWSER = "zen-beta";
    };
    bashrcExtra = ''
      			ncg() {
      				if [["$1" == "-g" && -n "$2" ]]; then
      					echo "Deleting all but the last $2 generations..."
      					sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations "+$2"
      					sudo nix-collect-garbage
      				else
      					sudo nix-collect-garbage -d
      				fi
      			}
      		'';
  };
}

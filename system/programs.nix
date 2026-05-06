{ inputs, ... }:

{
  imports = [ inputs.monique.nixosModules.default ];

  programs.monique.enable = true;
  programs.steam.enable = false;
}

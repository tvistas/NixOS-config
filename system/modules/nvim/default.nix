{ inputs, ... }:

{
  imports = [
    inputs.nixvim.nixosModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    imports = [
      ./plugins
      ./settings.nix
      ./keymaps.nix
    ];
  };
}

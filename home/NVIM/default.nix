{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
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

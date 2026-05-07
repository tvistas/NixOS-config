{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };
    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    nixvim.url = "github:nix-community/nixvim";
    vicinae.url = "github:vicinaehq/vicinae";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    let
      mkSystem =
        deviceName:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs deviceName; };
          modules = [
            ./devices/${deviceName}/configuration.nix
          ];
        };

      pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in
    {
      nixosConfigurations = {
        laptop = mkSystem "laptop";
        desktop = mkSystem "desktop";
      };

      devShells."x86_64-linux" = {
        website = import ./system/dev-shells/website.nix { inherit pkgs; };
        osiris = import ./system/dev-shells/osiris.nix { inherit pkgs; };
        rust = import ./system/dev-shells/rust.nix { inherit pkgs; };
      };
    };
}

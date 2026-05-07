{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };

    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "github:sodiboo/niri-flake";

    oniri.url = "github:tvistas/oniri";

    nixvim.url = "github:nix-community/nixvim";

    vicinae.url = "github:vicinaehq/vicinae";

    monique.url = "github:ToRvaLDz/monique";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      mkSystem =
        deviceName:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs deviceName; };
          modules = [
            ./devices/${deviceName}/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs deviceName; };
                users.tvistas = import ./home;
              };
            }
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

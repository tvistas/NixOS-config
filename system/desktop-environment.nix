{
  inputs,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  imports = [
    inputs.niri.nixosModules.niri
  ];

  programs.niri.enable = true;
  programs.niri.package = pkgs.niri-unstable;
}

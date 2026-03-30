{ pkgs, inputs, ... }:

{
  services.ollama = {
    enable = true;
    acceleration = "rocm";
  };

  nixpkgs.overlays = [ inputs.claude-code.overlays.default ];
  home.packages = [ pkgs.claude-code ];
}

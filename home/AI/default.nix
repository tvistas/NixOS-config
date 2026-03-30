{ pkgs, inputs, ... }:

{
  services.ollama = {
    enable = true;
    acceleration = "rocm";
  };

  home.packages = [ inputs.claude-code.packages.${pkgs.system}.default ];
}

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    aider-chat
  ];

  services.ollama = {
    enable = true;
    acceleration = "rocm";

    environmentVariables = {
      OLLAMA_CONTEXT_LENGTH = "8192";
    };
  };
}

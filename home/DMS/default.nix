{ inputs, pkgs, ... }:

{
  imports = [
    inputs.dms.homeModules.dank-material-shell
  ];

  home.packages = with pkgs; [
    gpu-screen-recorder
  ];

  home.sessionVariables = {
    DMS_DISABLE_MATUGEN = 1;
  };

  programs.dank-material-shell = {
    enable = true;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };
  };
}

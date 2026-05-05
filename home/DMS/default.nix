{ inputs, ... }:

{
  imports = [
    inputs.dms.homeModules.dank-material-shell
  ];

  environment.sessionVariables = {
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

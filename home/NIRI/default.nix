{
  config,
  deviceName,
  inputs,
  pkgs,
  ...
}:

{
  home.packages = [ inputs.oniri.packages.${pkgs.system}.default ];

  xdg.configFile."niri/modules".source =
    config.lib.file.mkOutOfStoreSymlink "/home/tvistas/.nixos-config/home/NIRI/modules";
  xdg.configFile."niri/config.kdl".source =
    config.lib.file.mkOutOfStoreSymlink "/home/tvistas/.nixos-config/home/NIRI/${deviceName}.kdl";
}

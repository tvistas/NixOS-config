{ config, deviceName, ... }:

{
  xdg.configFile."niri/config.kdl".source =
    config.lib.file.mkOutOfStoreSymlink "/home/tvistas/.nixos-config/home/NIRI/${deviceName}.kdl";
}

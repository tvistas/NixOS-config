{ deviceName, ... }:

{
  programs.niri.config = builtins.readFile ./config-${deviceName}.kdl;
}

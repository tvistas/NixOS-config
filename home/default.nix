{
  config,
  pkgs,
  lib,
  ...
}:

let
  subdirs = builtins.readDir ./.;

  modulesDirs = builtins.filter (name: subdirs.${name} == "directory") (builtins.attrNames subdirs);

  modules = builtins.map (dir: ./${dir}) modulesDirs;
in

{
  home.username = "tvistas";
  home.homeDirectory = "/home/tvistas";
  home.stateVersion = "25.11";

  imports = modules;
}

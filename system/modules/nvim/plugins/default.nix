{ config, pkgs, lib, ... }:

let
	subdirs = builtins.readDir ./.;

	pluginsDirs = builtins.filter
		(name: subdirs.${name} == "directory")
		(builtins.attrNames subdirs);

	plugins = builtins.map
		(dir: ./${dir})
		pluginsDirs;
in

{
  plugins.lz-n.enable = true;

	imports = plugins;
}

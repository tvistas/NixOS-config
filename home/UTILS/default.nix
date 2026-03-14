{ config, pkgs, lib, ...}:

{
	imports = [
		./variables.nix
		./fonts.nix
		./clipse.nix
		./cursor.nix
		./icons.nix
		./mimeapps.nix
	];
}

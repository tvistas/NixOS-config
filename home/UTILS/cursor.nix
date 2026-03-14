{ config, pkgs, lib, ...}:

{
	home.pointerCursor = {
		gtk.enable = true;
		x11.enable = true;

		name = "Quintom_Ink";
		package = pkgs.quintom-cursor-theme;
		size = 36;
	};
}

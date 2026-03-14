{ config, pkgs, lib, ...}:

{
	programs.ghostty = {
		enable = true;
		enableBashIntegration = true;
	
		settings = {
			theme = "Vague";
			background-opacity = 1;
			background-blur = false;
		};
	};
}

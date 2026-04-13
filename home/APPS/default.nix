{ pkgs, ... }:

{
  home.packages = with pkgs; [
    slack
    prismlauncher
    thunderbird
    mpv
  ];

  programs.onlyoffice = {
    enable = true;
  };
  programs.vesktop = {
    enable = true;
  };
  programs.obs-studio = {
    enable = true;
  };
  programs.element-desktop = {
    enable = true;
  };

  xdg.desktopEntries = {
    vesktop = {
      name = "Discord";
      icon = "/etc/profiles/per-user/tvistas/share/icons/Colloid-Light/apps/scalable/discord.svg";
    };
  };
}

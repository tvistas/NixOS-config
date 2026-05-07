{
  lib,
  fetchFromGitHub,
  gnumake,
  hyprland,
  hyprlandPlugins,
}:

hyprlandPlugins.mkHyprlandPlugin (finalAttrs: {
  pluginName = "hyprglass";
  version = "0.1.0";
  src = fetchFromGitHub {
    owner = "hyprnux";
    repo = "hyprglass";
    rev = "v${finalAttrs.version}";
    hash = "sha256-RCJ+IaOcbQSDCLmuE8/5C2nImS3TZfYT8YN/RZQHPJ0=";
  };

  nativeBuildInputs = [
    gnumake
  ];

  meta = {
    homepage = "https://github.com/hyprnux/hyprglass";
    description = "Hyprland plugin (hyprglass)";
    platforms = lib.platforms.linux;
  };
})

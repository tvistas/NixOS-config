{ pkgs, ... }:

{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "spelunk.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "EvWilson";
        repo = "spelunk.nvim";
        rev = "213c65863d80f5625c25405243d176ed11dc3740";
        hash = "sha256-I8SCua3XRJpUT3s7UeKPwtlO07G4Fih6qAVIYecBpBU=";
      };

      nvimSkipModule = [
        "spelunk.fuzzy.telescope"
        "spelunk.fuzzy.snacks"
        "spelunk.fuzzy.fzf-lua"
      ];
    })
  ];
  extraConfigLua = ''
    require('spelunk').setup({
      enable_persist = true
    })
  '';
}

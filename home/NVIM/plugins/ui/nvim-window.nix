{ pkgs, ... }:

{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "nvim-window";
      src = pkgs.fetchFromGitHub {
        owner = "yorickpeterse";
        repo = "nvim-window";
        rev = "48e44d492d2adaf9aac72a0f4ff21d6caae1b6a2";
        hash = "sha256-TUD+5yVFf0yjG/eGP7AAq0NX+XlGs0RGz5GRlkStoKg=";
      };
    })
  ];
  keymaps = [
    {
      mode = "n";
      key = "<leader>w";
      action = "<cmd>lua require('nvim-window').pick()<cr>";
      options.desc = "Choose current window";
    }
  ];
}

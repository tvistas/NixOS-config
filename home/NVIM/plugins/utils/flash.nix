{ lib, ... }:

{
  plugins.flash = {
    enable = true;
    settings = {
      labels = "asdfghjklqwertyuiopzxcvbnm";
    };

    lazyLoad = {
      enable = true;
      settings = {
        event = [
          "BufReadPost"
          "BufNewFile"
        ];
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "s";
      action = "<cmd>lua require('flash').jump()<cr>";
      options.desc = "Flash Jump";
    }
    {
      mode = "n";
      key = "S";
      action = "<cmd>lua require('flash').treesitter()<cr>";
      options.desc = "Flash Treesitter";
    }
    {
      mode = "o";
      key = "r";
      action = "<cmd>lua require('flash').remote()<cr>";
      options.desc = "Remote Flash";
    }
  ];
}

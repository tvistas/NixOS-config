{lib, ...}:

{
  plugins.telescope = {
    enable = true;
    extensions.fzf-native.enable = true;
    extensions.ui-select = {
      enable = true;
      settings = {
        __raw = ''
          require("telescope.themes").get_dropdown {
            width = 0.8,
            previewer = false,
          }
        '';
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<cr>";
      options.desc = "Telescope Find Files";
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<cr>";
      options.desc = "Telescope Live Grep";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<cr>";
      options.desc = "Telescope Buffers";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<cr>";
      options.desc = "Telescope Help Tags";
    }
  ];
}

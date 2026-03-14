{ lib, ... }:

{
  plugins.yazi = {
    enable = true;
    settings = {
      open_for_directories = true;
      enable_mouse_support = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>y";
      action = "<cmd>Yazi<cr>";
      options.desc = "Open yazi at current file";
    }
    {
      mode = "n";
      key = "<leader>cw";
      action = "<cmd>Yazi cwd<cr>";
      options.desc = "Open Yazi in nvim's working directory";
    }
  ];
}

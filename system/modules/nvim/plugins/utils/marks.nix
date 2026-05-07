{
  plugins.marks = {
    enable = true;
    settings = {
      default_mappings = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>m";
      action = "<cmd>MarksListBuf<cr>";
      options.desc = "List current marks";
    }
    {
      mode = "n";
      key = "<leader>M";
      action = "<cmd>MarksListAll<cr>";
      options.desc = "List all marks";
    }
  ];
}

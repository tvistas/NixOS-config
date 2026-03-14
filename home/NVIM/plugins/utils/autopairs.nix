{
  plugins.nvim-autopairs = {
    enable = true;
    settings = {
      disable_filetype = [
        "TelescopePrompt"
        "vim"
      ];
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
}

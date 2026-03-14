{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "vague";
      };
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

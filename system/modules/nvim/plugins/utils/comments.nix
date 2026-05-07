{
  plugins.comment = {
    enable = true;

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

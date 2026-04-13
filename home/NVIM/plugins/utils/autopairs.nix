{
  plugins = {
    nvim-autopairs = {
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

    mini-surround = {
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

      settings = {
        mappings = {
          add = "oa";
          delete = "od";
          find = "of";
          find_left = "oF";
          highlight = "oh";
          replace = "or";

          suffix_last = "l";
          suffix_next = "n";
        };
      };

    };
  };
}

{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      sources = {
        default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];
      };

      signature = {
        enabled = true;
      };

      keymap = {
        preset = "none";

        "<Tab>" = [
          "accept"
          "fallback"
        ];
        "<S-Tab>" = [
          "select_prev"
          "fallback"
        ];

        "<CR>" = [
          "accept"
          "fallback"
        ];

        "<C-k>" = [
          "select_prev"
          "fallback"
        ];
        "<C-j>" = [
          "select_next"
          "fallback"
        ];
        "<C-b>" = [
          "scroll_documentation_up"
          "fallback"
        ];
        "<C-f>" = [
          "scroll_documentation_down"
          "fallback"
        ];
      };

      completion = {
        list = {
          selection = {
            preselect = true;
            auto_insert = false;
          };
        };
      };
    };
  };
}

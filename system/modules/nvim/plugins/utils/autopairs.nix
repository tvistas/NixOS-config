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

    nvim-surround = {
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
  };
  keymaps = [
    {
      mode = "i";
      key = "<C-g>s";
      action = "<Plug>(nvim-surround-insert)";
      options.desc = "Surround: Insert";
    }
    {
      mode = "i";
      key = "<C-g>S";
      action = "<Plug>(nvim-surround-insert-line)";
      options.desc = "Surround: Insert line";
    }

    {
      mode = "n";
      key = "<C-s>";
      action = "<Plug>(nvim-surround-normal)";
      options.desc = "Surround: Add (motion)";
    }
    {
      mode = "n";
      key = "<C-s>s";
      action = "<Plug>(nvim-surround-normal-cur)";
      options.desc = "Surround: Add to current line";
    }
    {
      mode = "n";
      key = "<C-s>S";
      action = "<Plug>(nvim-surround-normal-line)";
      options.desc = "Surround: Add linewise (motion)";
    }
    {
      mode = "n";
      key = "ySS";
      action = "<Plug>(nvim-surround-normal-cur-line)";
      options.desc = "Surround: Add linewise to current line";
    }
    {
      mode = "n";
      key = "ds";
      action = "<Plug>(nvim-surround-delete)";
      options.desc = "Surround: Delete";
    }
    {
      mode = "n";
      key = "cs";
      action = "<Plug>(nvim-surround-change)";
      options.desc = "Surround: Change";
    }
    {
      mode = "n";
      key = "cS";
      action = "<Plug>(nvim-surround-change-line)";
      options.desc = "Surround: Change linewise";
    }

    {
      mode = "v";
      key = "S";
      action = "<Plug>(nvim-surround-visual)";
      options.desc = "Surround: Add to selection";
    }
    {
      mode = "v";
      key = "gS";
      action = "<Plug>(nvim-surround-visual-line)";
      options.desc = "Surround: Add linewise to selection";
    }
  ];
}

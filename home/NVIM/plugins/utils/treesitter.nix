{
  plugins = {
    treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;
      folding.enable = true;

      nixvimInjections = true;

      settings = {
        auto_install = true;

        ensure_installed = [
          "bash"
          "c"
          "cpp"
          "fortran"
          "css"
          "html"
          "javascript"
          "json"
          "lua"
          "markdown"
          "markdown_inline"
          "python"
          "regex"
          "rust"
          "toml"
          "tsx"
          "typescript"
          "vimdoc"
          "yaml"
          "nix"
          "vim"
        ];
      };
    };

    ts-autotag.enable = true;

    treesitter-context = {
      enable = true;
      settings.max_lines = 3;
    };

    treesitter-textobjects = {
      enable = true;
      settings = {
        select = {
          enable = true;
          lookahead = true;
          keymaps = {
            "af" = "@function.outer";
            "if" = "@function.inner";
            "ac" = "@class.outer";
            "ic" = "@class.inner";
            "aa" = "@parameter.outer";
            "ia" = "@parameter.inner";
          };
        };
        swap = {
          enable = true;
          swap_next = {
            "<leader>a" = "@parameter.inner";
          };
          swap_previous = {
            "<leader>A" = "@parameter.inner";
          };
        };
        move = {
          enable = true;
          goto_next_start = {
            "]f" = "@function.outer";
            "]c" = "@class.outer";
            "]a" = "@parameter.inner";
          };
          goto_previous_start = {
            "[f" = "@function.outer";
            "[c" = "@class.outer";
            "[a" = "@parameter.inner";
          };
        };
      };
    };

    treesitter-refactor = {
      enable = true;
      settings = {
        smart_rename = {
          enable = true;
          keymaps.smart_rename = "grr";
        };
      };
    };
  };
}

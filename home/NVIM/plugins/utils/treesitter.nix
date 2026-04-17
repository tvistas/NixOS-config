{
  plugins = {
    treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;
      folding.enable = true;
      nixvimInjections = true;

    };

    ts-autotag.enable = true;
    treesitter-textobjects.enable = true;

    treesitter-context = {
      enable = true;
      settings.max_lines = 3;
    };
  };

  keymaps = [
    {
      mode = [
        "x"
        "o"
      ];
      key = "af";
      action = "<cmd>lua require('nvim-treesitter-textobjects.select').select_textobject('@function.outer')<cr>";
      options.desc = "Select outer function";
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "if";
      action = "<cmd>lua require('nvim-treesitter-textobjects.select').select_textobject('@function.inner')<cr>";
      options.desc = "Select inner function";
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "ac";
      action = "<cmd>lua require('nvim-treesitter-textobjects.select').select_textobject('@class.outer')<cr>";
      options.desc = "Select outer class";
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "ic";
      action = "<cmd>lua require('nvim-treesitter-textobjects.select').select_textobject('@class.inner')<cr>";
      options.desc = "Select inner class";
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "aa";
      action = "<cmd>lua require('nvim-treesitter-textobjects.select').select_textobject('@parameter.outer')<cr>";
      options.desc = "Select outer parameter";
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "ia";
      action = "<cmd>lua require('nvim-treesitter-textobjects.select').select_textobject('@parameter.inner')<cr>";
      options.desc = "Select inner parameter";
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "ab";
      action = "<cmd>lua require('nvim-treesitter-textobjects.select').select_textobject('@block.outer')<cr>";
      options.desc = "Select outer block";
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "ib";
      action = "<cmd>lua require('nvim-treesitter-textobjects.select').select_textobject('@block.inner')<cr>";
      options.desc = "Select inner block";
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "ai";
      action = "<cmd>lua require('nvim-treesitter-textobjects.select').select_textobject('@conditional.outer')<cr>";
      options.desc = "Select outer conditional";
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "ii";
      action = "<cmd>lua require('nvim-treesitter-textobjects.select').select_textobject('@conditional.inner')<cr>";
      options.desc = "Select inner conditional";
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "al";
      action = "<cmd>lua require('nvim-treesitter-textobjects.select').select_textobject('@loop.outer')<cr>";
      options.desc = "Select outer loop";
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "il";
      action = "<cmd>lua require('nvim-treesitter-textobjects.select').select_textobject('@loop.inner')<cr>";
      options.desc = "Select inner loop";
    }

    {
      mode = "n";
      key = "]f";
      action = "<cmd>lua require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer')<cr>";
      options.desc = "Next function start";
    }
    {
      mode = "n";
      key = "]c";
      action = "<cmd>lua require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer')<cr>";
      options.desc = "Next class start";
    }
    {
      mode = "n";
      key = "]a";
      action = "<cmd>lua require('nvim-treesitter-textobjects.move').goto_next_start('@parameter.inner')<cr>";
      options.desc = "Next parameter";
    }
    {
      mode = "n";
      key = "[f";
      action = "<cmd>lua require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer')<cr>";
      options.desc = "Previous function start";
    }
    {
      mode = "n";
      key = "[c";
      action = "<cmd>lua require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer')<cr>";
      options.desc = "Previous class start";
    }
    {
      mode = "n";
      key = "[a";
      action = "<cmd>lua require('nvim-treesitter-textobjects.move').goto_previous_start('@parameter.inner')<cr>";
      options.desc = "Previous parameter";
    }

    {
      mode = "n";
      key = "<leader>a";
      action = "<cmd>lua require('nvim-treesitter-textobjects.swap').swap_next('@parameter.inner')<cr>";
      options.desc = "Swap with next parameter";
    }
    {
      mode = "n";
      key = "<leader>A";
      action = "<cmd>lua require('nvim-treesitter-textobjects.swap').swap_previous('@parameter.inner')<cr>";
      options.desc = "Swap with previous parameter";
    }
  ];
}

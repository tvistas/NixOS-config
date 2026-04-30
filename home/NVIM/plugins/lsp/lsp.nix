{
  plugins = {
    lsp-lines = {
      enable = true;
    };

    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        html.enable = true;
        lua_ls.enable = true;
        nixd.enable = true;
        ts_ls.enable = true;
        marksman.enable = true;
        pyright.enable = true;
        clangd.enable = true;
        fortls.enable = true;
      };

      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "]d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "[d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };

  extraConfigLua = ''
    local _border = "rounded"

    local orig_hover = vim.lsp.buf.hover
    vim.lsp.buf.hover = function(config)
      orig_hover(vim.tbl_deep_extend("force", config or {}, { border = _border }))
    end

    local orig_signature_help = vim.lsp.buf.signature_help
    vim.lsp.buf.signature_help = function(config)
      orig_signature_help(vim.tbl_deep_extend("force", config or {}, { border = _border }))
    end

    vim.diagnostic.config({
      float = { border = _border }
    })

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }

    vim.o.updatetime = 250

    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, {
          focusable = false,
          border = _border,
          source = "always",
          prefix = "",
          scope = "line",
        })
      end
    })
  '';
}

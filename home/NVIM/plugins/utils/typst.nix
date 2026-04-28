{ pkgs, ... }:

{
  home.packages = with pkgs; [
    typst
  ];

  programs.nixvim = {
    extraConfigLua = ''
      local function setup_typst_buffer(bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'spell', true)
        vim.api.nvim_buf_set_option(bufnr, 'spelllang', 'pt,en')

        local filename = vim.api.nvim_buf_get_name(bufnr)
        local pdfname = filename:gsub('%.typ$', '.pdf')
        if vim.b[bufnr].typst_watch_job then
          return
        end
        local watch_job = vim.fn.jobstart(
          string.format('typst watch "%s"', filename),
          { detach = true, on_exit = function() vim.b[bufnr].typst_watch_job = nil end }
        )
        vim.b[bufnr].typst_watch_job = watch_job
        vim.defer_fn(function()
          if vim.fn.executable('sioyek') == 1 then
            vim.fn.jobstart(string.format('sioyek "%s"', pdfname), { detach = true })
          end
        end, 1000)
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "typst",
        callback = function(args)
          setup_typst_buffer(args.buf)
        end,
      })
    '';
  };
}

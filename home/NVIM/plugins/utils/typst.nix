{ pkgs, ... }:

{
  home.packages = with pkgs; [
    typst
  ];

  autoCmd = [
    {
      event = [
        "BufRead"
        "BufNewFile"
      ];
      pattern = "*.typ";
      command = "setlocal spell spelllang=pt,en";
    }

    {
      event = [ "BufWritePost" ];
      pattern = "*.typ";
      callback = {
        __raw = ''
          function()
            local file = vim.fn.expand('%:p')
            local pdf = vim.fn.expand('%:p:r') .. '.pdf'
            
            vim.fn.jobstart({'typst', 'compile', file, pdf}, {
              on_exit = function(_, exit_code)
                if exit_code == 0 then
                  local zathura_running = vim.fn.system(
                    string.format("pgrep -f 'zathura.*%s'", vim.fn.fnamemodify(pdf, ':t'))
                  )
                  
                  if zathura_running == "" then
                    vim.fn.jobstart({'zathura', pdf}, {detach = true})
                  end
                else
                  vim.notify('Typst compilation failed', vim.log.levels.ERROR)
                end
              end
            })
          end
        '';
      };
    }

    {
      event = [ "BufEnter" ];
      pattern = "*.typ";
      callback = {
        __raw = ''
          function()
            local file = vim.fn.expand('%:p')
            if vim.fn.filereadable(file) == 1 then
              local pdf = vim.fn.expand('%:p:r') .. '.pdf'
              
              vim.fn.jobstart({'typst', 'compile', file, pdf}, {
                on_exit = function(_, exit_code)
                  if exit_code == 0 then
                    local zathura_running = vim.fn.system(
                      string.format("pgrep -f 'zathura.*%s'", vim.fn.fnamemodify(pdf, ':t'))
                    )
                    
                    if zathura_running == "" then
                      vim.fn.jobstart({'zathura', pdf}, {detach = true})
                    end
                  end
                end
              })
            end
          end
        '';
      };
    }
  ];
}

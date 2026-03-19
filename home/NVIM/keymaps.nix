{ lib, ... }:

{
  keymaps = [
    {
      mode = "n";
      action = "goVGy";
      key = "yA";
      options.desc = "Yank All";
    }
    {
      mode = "n";
      key = "<leader>r";
      action.__raw = ''
        function()
          local word = vim.fn.expand("<cword>")
          local new = vim.fn.input("Change " .. word .. " to: ", word)
          if new ~= "" and new ~= word then
            local escaped_word = vim.fn.escape(word, [[\/]])
            local escaped_new = vim.fn.escape(new, [[\/]])
            vim.cmd("%s/\\<" .. escaped_word .. "\\>/" .. escaped_new .. "/gc")
          end
        end
      '';
      options = {
        desc = "Rename word under cursor";
      };
    }
  ];
}

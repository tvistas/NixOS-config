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
      mode = [
        "n"
        "v"
      ];
      key = "<leader>r";
      action.__raw = ''
        function()
          local mode = vim.fn.mode()
          local text

          if mode == "v" or mode == "V" or mode == "\22" then
            local start_pos = vim.fn.getpos("'<")
            local end_pos = vim.fn.getpos("'>")
            local lines = vim.fn.getline(start_pos[2], end_pos[2])

            if #lines == 1 then
              text = string.sub(lines[1], start_pos[3], end_pos[3])
            else
              lines[1] = string.sub(lines[1], start_pos[3])
              lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
              text = table.concat(lines, "\n")
            end
          else
            text = vim.fn.expand("<cword>")
          end

          local new = vim.fn.input("Change " .. text .. " to: ", text)

          if new ~= "" and new ~= text then
            local escaped_text = vim.fn.escape(text, [[\/]])
            local escaped_new = vim.fn.escape(new, [[\/]])
            vim.cmd("%s/" .. escaped_text .. "/" .. escaped_new .. "/gc")
          end
        end
      '';
      options = {
        desc = "Rename word or selection";
      };
    }
  ];
}

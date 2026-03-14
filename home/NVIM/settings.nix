{ lib, ... }:

{
  globals = {
    mapleader = " ";
    maplocalleader = "//";
  };

  opts = {
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    ignorecase = true;
    number = true;
    relativenumber = true;
    signcolumn = "yes";
    updatetime = 500;
    termguicolors = true;
  };

  clipboard.register = "unnamedplus";

  colorschemes.vague = {
    enable = true;

    settings.italic = false;
  };
}

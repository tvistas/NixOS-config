{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;

    plugins = with pkgs.yaziPlugins; {
      bookmarks = bookmarks;
      relative-motions = relative-motions;
      recycle-bin = recycle-bin;
      wl-clipboard = wl-clipboard;
      sshfs = pkgs.fetchFromGitHub {
        owner = "uhs-robert";
        repo = "sshfs.yazi";
        rev = "main";
        sha256 = "sha256-p5ZsqlqsDtFA5f03U7qtBWtAfCzKnckez+g72rv7Stk=";
      };
    };

    initLua = ./init.lua;

    settings = {
      keymap = {
        mgr.prepend_keymap = [
          #YANK
          {
            run = [ "plugin wl-clipboard" ];
            on = "<C-y>";
          }

          #SSHFS
          {
            run = "plugin sshfs -- menu";
            on = [
              "M"
              "s"
            ];
          }

          #TRASH-CLI
          {
            run = "plugin recycle-bin";
            on = [ "T" ];
          }

          #BOOKMARKS
          {
            run = "plugin bookmarks save";
            on = [ "m" ];
          }
          {
            run = "plugin bookmarks jump";
            on = [ "'" ];
          }
          {
            run = "plugin bookmarks delete";
            on = [ "D" ];
          }

          #RELATIVE-MOTIONS
          {
            run = "plugin relative-motions 1";
            on = [ "1" ];
          }
          {
            run = "plugin relative-motions 2";
            on = [ "2" ];
          }
          {
            run = "plugin relative-motions 3";
            on = [ "3" ];
          }
          {
            run = "plugin relative-motions 4";
            on = [ "4" ];
          }
          {
            run = "plugin relative-motions 5";
            on = [ "5" ];
          }
          {
            run = "plugin relative-motions 6";
            on = [ "6" ];
          }
          {
            run = "plugin relative-motions 7";
            on = [ "7" ];
          }
          {
            run = "plugin relative-motions 8";
            on = [ "8" ];
          }
          {
            run = "plugin relative-motions 9";
            on = [ "9" ];
          }
        ];
      };
    };
  };
}

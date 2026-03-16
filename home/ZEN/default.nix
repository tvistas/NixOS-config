{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

let
  mkProfile =
    {
      id,
      isDefault ? false,
      extraConfig ? { },
    }:
    lib.recursiveUpdate {
      inherit id isDefault;

      settings = {
        "general.autoScroll" = true;
      };

      bookmarks = {
        force = true;
        settings = [
          {
            name = "Bookmarks Toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "Fenix";
                url = "https://fenix.tecnico.ulisboa.pt/student";
              }
              {
                name = "Youtube";
                url = "https://www.youtube.com/";
              }
              {
                name = "Github";
                url = "https://github.com/";
              }
              {
                name = "Drive";
                url = "https://drive.google.com/drive/u/0/home";
              }
              {
                name = "Onedrive";
                url = "https://ulisboa-my.sharepoint.com/";
              }
              {
                name = "ChatGPT";
                url = "https://chatgpt.com/";
              }
              {
                name = "Deepseek";
                url = "https://chat.deepseek.com/";
              }
              {
                name = "Gemini";
                url = "https://gemini.google.com/u/1/app?hl=pt-PT";
              }
            ];
          }
        ];
      };

    } extraConfig;

in
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;

    profiles = {
      "default" = mkProfile {
        id = 0;
        isDefault = true;
        extraConfig = {
          spacesForce = true;
          spaces = {
            "default" = {
              name = "Default";
              id = "6e71129c-dad6-4584-a47f-3ba8944cb687";
              position = 0;
              icon = "💻";
            };
            "estudo" = {
              name = "Estudo";
              id = "3b473252-18b5-4015-adec-e740a78f81d3";
              position = 1;
              icon = "📚";
            };
          };
        };
      };

      "productivity" = mkProfile {
        id = 1;
        extraConfig = {
          spacesForce = true;
          spaces = {
            "pic" = {
              name = "PIC";
              id = "2396121b-f3d3-4a11-9c91-f8676976ead9";
              position = 0;
              icon = "🛠️";
            };
            "website-dev" = {
              name = "Web site";
              id = "0ac6ca0a-186f-4995-8b56-1bfa49543a5e";
              position = 1;
              icon = "🌐";
            };
          };
        };
      };
    };
  };
}

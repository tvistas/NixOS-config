{
  xdg.mimeApps =
    let
      browserApp = "zen-beta.desktop";
      fileApp = "org.gnome.Nautilus.desktop";
      videoApp = "mpv.desktop";
      imageApp = browserApp;
      textApp = "nvim.desktop";
      officeApp = "onlyoffice-desktopeditors.desktop";
      discordApp = "vesktop.desktop";
      mailApp = "thunderbird.desktop";
      elementApp = "element-desktop.desktop";

      mapMimeToApp =
        app: mimes:
        builtins.listToAttrs (
          map (name: {
            inherit name;
            value = app;
          }) mimes
        );

      browserMimes = [
        "application/pdf"
        "application/x-extension-shtml"
        "application/x-extension-xhtml"
        "application/x-extension-html"
        "application/x-extension-xht"
        "application/x-extension-htm"
        "x-scheme-handler/unknown"
        "x-scheme-handler/chrome"
        "x-scheme-handler/about"
        "x-scheme-handler/https"
        "x-scheme-handler/http"
        "application/xhtml+xml"
        "application/json"
        "text/html"
      ];
      fileMimes = [
        "inode/directory"
      ];
      mediaMimes = [
        "video/mp4"
        "video/x-matroska"
        "video/webm"
        "video/quicktime"
        "video/x-msvideo"
        "video/x-flv"
        "audio/mpeg"
        "audio/x-wav"
        "audio/flac"
        "audio/ogg"
        "audio/mp4"
      ];

      imageMimes = [
        "image/jpeg"
        "image/png"
        "image/gif"
        "image/webp"
        "image/svg+xml"
      ];

      textMimes = [
        "text/plain"
        "text/markdown"
        "text/csv"
        "text/x-python"
        "text/x-shellscript"
        "text/x-c"
        "text/x-c++"
        "text/x-nix"
        "text/x-rust"
        "application/x-shellscript"
      ];

      officeMimes = [
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
        "application/msword"
        "application/vnd.oasis.opendocument.text"
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        "application/vnd.ms-excel"
        "application/vnd.oasis.opendocument.spreadsheet"
        "application/vnd.openxmlformats-officedocument.presentationml.presentation"
        "application/vnd.ms-powerpoint"
        "application/vnd.oasis.opendocument.presentation"
      ];

      discordMimes = [
        "x-scheme-handler/discord"
      ];

      mailMimes = [
        "x-scheme-handler/mailto"
        "message/rfc822"
      ];

      elementMimes = [
        "x-scheme-handler/element"
      ];

      associations =
        (mapMimeToApp browserApp browserMimes)
        // (mapMimeToApp fileApp fileMimes)
        // (mapMimeToApp videoApp mediaMimes)
        // (mapMimeToApp imageApp imageMimes)
        // (mapMimeToApp textApp textMimes)
        // (mapMimeToApp officeApp officeMimes)
        // (mapMimeToApp discordApp discordMimes)
        // (mapMimeToApp mailApp mailMimes)
        // (mapMimeToApp elementApp elementMimes);
    in
    {
      enable = true;
      associations.added = associations;
      defaultApplications = associations;
    };
}

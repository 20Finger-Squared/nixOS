{ inputs, pkgs, ... }:

let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
  programs.firefox = {
    enable = true;
    policies = {
      AppAutoUpdate = false;
      GenerativeAI.Chatbot = false;
      ExtensionSettings = {
        "*" = {
          installation_mode = "allowed";
          default_area = "navbar";
          private_browsing = true;
        };
      };
    };

    profiles.tf = {
      isDefault = true;

      bookmarks = {
        force = true;
        settings = [
          {
            toolbar = true;
            bookmarks = [
              {
                name = "Arch Wiki";
                tags = [
                  "wiki"
                  "linux"
                ];
                keyword = "arch";
                url = "https://wiki.archlinux.org/index.php";
              }
              {
                name = "Wikipedia";
                tags = [ "wiki" ];
                keyword = "wiki";
                url = "https://en.wikipedia.org/wiki/Wiki.com";
              }
            ];
          }
          { }
          {
            name = "Media";
            toolbar = true;
            bookmarks = [
              {
                name = "YouTube";
                tags = [
                  "video"
                  "media"
                ];
                keyword = "yt";
                url = "https://www.youtube.com";
              }
              {
                name = "YouTube Music";
                tags = [
                  "music"
                  "media"
                ];
                keyword = "ytm";
                url = "https://music.youtube.com";
              }
            ];
          }
          {
            name = "Nix sites";
            toolbar = true;
            bookmarks = [
              {
                name = "NixOS Homepage";
                url = "https://nixos.org/";
              }
              {
                name = "NixOS Wiki";
                tags = [
                  "wiki"
                  "nix"
                ];
                url = "https://wiki.nixos.org/";
              }
              {
                name = "Nix Builtins Reference";
                tags = [
                  "nix"
                  "reference"
                  "docs"
                ];
                keyword = "builtins";
                url = "https://nix.dev/manual/nix/2.28/language/builtins.html";
              }
            ];
          }
        ];
      };

      search = {
        privateDefault = "ddg";
        default = "ddg";
        force = true;
      };

      extensions = {
        force = true;
        packages = [
          addons.vimium-c
          addons.gruvbox-dark-theme
          addons.ublock-origin
          addons.clearurls
          addons.private-relay
          addons.privacy-badger
          addons.consent-o-matic
        ];
      };
    };
  };
}

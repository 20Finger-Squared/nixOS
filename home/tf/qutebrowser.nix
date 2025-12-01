{
  colorscheme,
  nixpkgs-24-11,
  ...
}:
{
  programs.qutebrowser = {
    enable = true;
    enableDefaultBindings = true;
    package = nixpkgs-24-11.qutebrowser;

    quickmarks = {
      nixlib = "https://teu5us.github.io/nix-lib.html";
      ytm = "https://music.youtube.com/";
      nixsource = "https://github.com/NixOS/nixpkgs/tree/master/doc";
      yt = "https://youtube.com/";
    };

    searchEngines = {
      np = "https://search.nixos.org/packages?channel=25.05&query={}";
      no = "https://search.nixos.org/options?channel=25.05&query={}";
      hm = "https://home-manager-options.extranix.com/?query={}";
      yt = "https://youtube.com/search?q={}";
      ytm = "https://music.youtube.com/search?q={}";
    };

    settings = {
      confirm_quit = [ "always" ];
      auto_save.session = true;
      fonts.default_family = "JetbrainMono NF";
      fonts.default_size = "14px";

      hints.min_chars = 1;

      scrolling.smooth = true;

      tabs.position = "left";
      tabs.show = "switching";
      tabs.wrap = true;
      colors = {
        completion = {
          category = {
            fg = "#${colorscheme.base05}";
            bg = "#${colorscheme.base00}";
            border = {
              bottom = "#${colorscheme.base0C}";
              top = "#${colorscheme.base00}";
            };
          };

          even.bg = "#${colorscheme.base00}";
          odd.bg = "#${colorscheme.base00}";
          fg = "#${colorscheme.base05}";
          item = {
            selected = {
              fg = "#${colorscheme.base0A}";
              bg = "#${colorscheme.base02}";
              match.fg = "#${colorscheme.base0A}";
              border = {
                top = "#${colorscheme.base02}";
                bottom = "#${colorscheme.base0A}";
              };
            };
          };
          match.fg = "#${colorscheme.base0A}";

          scrollbar = {
            fg = "#${colorscheme.base04}";
            bg = "#${colorscheme.base02}";
          };
        };

        contextmenu = {
          disabled = {
            fg = "#${colorscheme.base03}";
            bg = "#${colorscheme.base00}";
          };
          menu = {
            fg = "#${colorscheme.base05}";
            bg = "#${colorscheme.base00}";
          };
          selected = {
            fg = "#${colorscheme.base0A}";
            bg = "#${colorscheme.base00}";
          };
        };

        downloads = {
          bar.bg = "#${colorscheme.base0D}";
          error = {
            fg = "#${colorscheme.base08}";
            bg = "#${colorscheme.base00}";
          };
          start = {
            fg = "#${colorscheme.base0D}";
            bg = "#${colorscheme.base00}";
          };
          stop = {
            fg = "#${colorscheme.base09}";
            bg = "#${colorscheme.base00}";
          };
          system = {
            fg = "rgb";
            bg = "rgb";
          };
        };

        hints = {
          bg = "#${colorscheme.base00}";
          fg = "#${colorscheme.base05}";
          match.fg = "#${colorscheme.base0A}";
        };

        keyhint = {
          fg = "#${colorscheme.base05}";
          bg = "#${colorscheme.base00}";
          suffix.fg = "#${colorscheme.base0A}";
        };

        messages = {
          error = {
            border = "#${colorscheme.base08}";
            fg = "#${colorscheme.base08}";
            bg = "#${colorscheme.base00}";
          };
          info = {
            border = "#${colorscheme.base0C}";
            fg = "#${colorscheme.base05}";
            bg = "#${colorscheme.base00}";
          };
          warning = {
            border = "#${colorscheme.base09}";
            fg = "#${colorscheme.base00}";
            bg = "#${colorscheme.base00}";
          };
        };

        prompts = {
          border = "#${colorscheme.base02}";
          fg = "#${colorscheme.base04}";
          bg = "#${colorscheme.base02}";
          selected = {
            fg = "#${colorscheme.base05}";
            bg = "#${colorscheme.base00}";
          };
        };

        statusbar = {
          caret = {
            fg = "#${colorscheme.base05}";
            bg = "#${colorscheme.base00}";
            selection = {
              fg = "#${colorscheme.base0D}";
              bg = "#${colorscheme.base00}";
            };
          };

          command = {
            fg = "#${colorscheme.base05}";
            bg = "#${colorscheme.base00}";
            private = {
              fg = "#${colorscheme.base05}";
              bg = "#${colorscheme.base00}";
            };
          };

          insert = {
            fg = "#${colorscheme.base0A}";
            bg = "#${colorscheme.base00}";
          };

          normal = {
            fg = "#${colorscheme.base05}";
            bg = "#${colorscheme.base00}";
          };

          passthrough = {
            fg = "#${colorscheme.base06}";
            bg = "#${colorscheme.base00}";
          };

          private = {
            fg = "#${colorscheme.base00}";
            bg = "#${colorscheme.base0E}";
          };

          progress.bg = "#${colorscheme.base0C}";

          url = {
            error.fg = "#${colorscheme.base08}";
            fg = "#${colorscheme.base05}";
            hover.fg = "#${colorscheme.base09}";
            warn.fg = "#${colorscheme.base0E}";
            success = {
              http.fg = "#${colorscheme.base0A}";
              https.fg = "#${colorscheme.base0A}";
            };
          };
        };

        tabs = {
          bar.bg = "#${colorscheme.base00}";

          even = {
            bg = "#${colorscheme.base00}";
            fg = "#${colorscheme.base05}";
          };
          odd = {
            bg = "#${colorscheme.base02}";
            fg = "#${colorscheme.base05}";
          };

          indicator = {
            error = "#${colorscheme.base08}";
            start = "#${colorscheme.base0C}";
            stop = "#${colorscheme.base00}";
            system = "rgb";
          };

          pinned = {
            even = {
              bg = "#${colorscheme.base0E}";
              fg = "#${colorscheme.base05}";
            };
            odd = {
              bg = "#${colorscheme.base0A}";
              fg = "#${colorscheme.base00}";
            };

            selected = {
              even = {
                bg = "#${colorscheme.base0A}";
                fg = "#${colorscheme.base00}";
              };
              odd = {
                bg = "#${colorscheme.base0A}";
                fg = "#${colorscheme.base00}";
              };
            };
          };

          selected = {
            even = {
              bg = "#${colorscheme.base0A}";
              fg = "#${colorscheme.base00}";
            };
            odd = {
              bg = "#${colorscheme.base0A}";
              fg = "#${colorscheme.base00}";
            };
          };
        };

        tooltip = {
          bg = "#${colorscheme.base00}";
          fg = "#${colorscheme.base05}";
        };

        webpage = {
          bg = "#${colorscheme.base00}";
          preferred_color_scheme = "dark";
          darkmode = {
            enabled = true;
            policy = {
              images = "smart";
              page = "smart";
            };
          };
        };
      };
    };
  };
}

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
      nixpkgs = "https://search.nixos.org/packages";
      nixopts = "https://search.nixos.org/options";
      nixlib = "https://teu5us.github.io/nix-lib.html";
      ytm = "https://music.youtube.com/";
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

      scrolling.smooth = true;
      tabs.position = "left";
      tabs.show = "switching";
      tabs.wrap = true;
      colors = {
        completion = {
          category = {
            fg = colorscheme.hex.fg.one;
            bg = colorscheme.hex.bg.one;
            border = {
              bottom = colorscheme.hex.muted.aqua;
              top = colorscheme.hex.bg.one;
            };
          };

          even.bg = colorscheme.hex.bg.zero;
          odd.bg = colorscheme.hex.bg.one;
          fg = colorscheme.hex.fg.one;
          item = {
            selected = {
              fg = colorscheme.hex.strong.yellow;
              bg = colorscheme.hex.bg.two;
              match.fg = colorscheme.hex.muted.yellow;
              border = {
                top = colorscheme.hex.bg.two;
                bottom = colorscheme.hex.muted.yellow;
              };
            };
          };
          match.fg = colorscheme.hex.muted.yellow;

          scrollbar = {
            fg = colorscheme.hex.fg.four;
            bg = colorscheme.hex.bg.two;
          };
        };

        contextmenu = {
          disabled = {
            fg = colorscheme.hex.bg.three;
            bg = colorscheme.hex.bg.one;
          };
          menu = {
            fg = colorscheme.hex.fg.one;
            bg = colorscheme.hex.bg.one;
          };
          selected = {
            fg = colorscheme.hex.muted.yellow;
            bg = colorscheme.hex.bg.one;
          };
        };

        downloads = {
          bar.bg = colorscheme.rgb.muted.blue;
          error = {
            fg = colorscheme.rgb.muted.red;
            bg = colorscheme.rgb.bg.one;
          };
          start = {
            fg = colorscheme.rgb.strong.blue;
            bg = colorscheme.rgb.bg.one;
          };
          stop = {
            fg = colorscheme.rgb.muted.orange;
            bg = colorscheme.rgb.bg.one;
          };
          system = {
            fg = "rgb";
            bg = "rgb";
          };
        };

        hints = {
          bg = colorscheme.hex.bg.one;
          fg = colorscheme.hex.fg.one;
          match.fg = colorscheme.hex.muted.yellow;
        };

        keyhint = {
          fg = colorscheme.hex.fg.one;
          bg = colorscheme.hex.bg.one;
          suffix.fg = colorscheme.hex.strong.yellow;
        };

        messages = {
          error = {
            border = colorscheme.hex.muted.red;
            fg = colorscheme.hex.strong.red;
            bg = colorscheme.hex.bg.one;
          };
          info = {
            border = colorscheme.hex.muted.aqua;
            fg = colorscheme.hex.fg.one;
            bg = colorscheme.hex.bg.one;
          };
          warning = {
            border = colorscheme.hex.muted.orange;
            fg = colorscheme.hex.bg.one;
            bg = colorscheme.hex.bg.one;
          };
        };

        prompts = {
          border = colorscheme.hex.bg.two;
          fg = colorscheme.hex.fg.two;
          bg = colorscheme.hex.bg.two;
          selected = {
            fg = colorscheme.hex.fg.one;
            bg = colorscheme.hex.bg.one;
          };
        };

        statusbar = {
          caret = {
            fg = colorscheme.hex.fg.one;
            bg = colorscheme.hex.bg.one;
            selection = {
              fg = colorscheme.hex.muted.blue;
              bg = colorscheme.hex.bg.one;
            };
          };

          command = {
            fg = colorscheme.hex.fg.one;
            bg = colorscheme.hex.bg.one;
            private = {
              fg = colorscheme.hex.fg.one;
              bg = colorscheme.hex.bg.one;
            };
          };

          insert = {
            fg = colorscheme.hex.muted.yellow;
            bg = colorscheme.hex.bg.one;
          };

          normal = {
            fg = colorscheme.hex.fg.one;
            bg = colorscheme.hex.bg.one;
          };

          passthrough = {
            fg = colorscheme.hex.fg.three;
            bg = colorscheme.hex.bg.one;
          };

          private = {
            fg = colorscheme.hex.bg.one;
            bg = colorscheme.hex.strong.purple;
          };

          progress.bg = colorscheme.hex.muted.aqua;

          url = {
            error.fg = colorscheme.hex.muted.red;
            fg = colorscheme.hex.fg.one;
            hover.fg = colorscheme.hex.strong.orange;
            warn.fg = colorscheme.hex.muted.purple;
            success = {
              http.fg = colorscheme.hex.muted.yellow;
              https.fg = colorscheme.hex.strong.yellow;
            };
          };

        };

        tabs = {
          bar.bg = colorscheme.hex.bg.one;

          even = {
            bg = colorscheme.hex.bg.one;
            fg = colorscheme.hex.fg.one;
          };
          odd = {
            bg = colorscheme.hex.bg.two;
            fg = colorscheme.hex.fg.one;
          };

          indicator = {
            error = colorscheme.hex.muted.red;
            start = colorscheme.hex.muted.aqua;
            stop = colorscheme.hex.bg.one;
            system = "rgb";
          };

          pinned = {
            even = {
              bg = colorscheme.hex.muted.purple;
              fg = colorscheme.hex.fg.one;
            };
            odd = {
              bg = colorscheme.hex.strong.purple;
              fg = colorscheme.hex.bg.one;
            };

            selected = {
              even = {
                bg = colorscheme.hex.muted.yellow;
                fg = colorscheme.hex.bg.one;
              };
              odd = {
                bg = colorscheme.hex.muted.yellow;
                fg = colorscheme.hex.bg.one;
              };
            };
          };

          selected = {
            even = {
              bg = colorscheme.hex.muted.yellow;
              fg = colorscheme.hex.bg.one;
            };
            odd = {
              bg = colorscheme.hex.muted.yellow;
              fg = colorscheme.hex.bg.one;
            };
          };
        };

        tooltip = {
          bg = colorscheme.hex.bg.one;
          fg = colorscheme.hex.fg.one;
        };

        webpage = {
          bg = colorscheme.hex.bg.one;
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

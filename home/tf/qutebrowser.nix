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
      nixpkgs = "";
      nixlib = "";
      ytm = "";
      yt = "";
    };

    searchEngines = {
      np = "";
      no = "";
      yt = "";
      ytm = "";
    };
    settings = {
      confirm_quit = true;

      colors = {
        completion = {
          category = {
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
            border = {
              bottom = config.colorscheme.bg .0;
              top = config.colorscheme.bg .0;
            };
          };
          even.bg = config.colorscheme.bg .0;
          odd.bg = config.colorscheme.bg .0;
          fg = config.colorscheme.bg .0;
          item = {
            selected = {
              fg = config.colorscheme.bg .0;
              bg = config.colorscheme.bg .0;
              border = {
                top = config.colorscheme.bg .0;
                bottom = config.colorscheme.bg .0;
              };
              match.fg = config.colorscheme.bg .0;
            };
          };
          match.fg = config.colorscheme.bg .0;
          scrollbar = {
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
        };

        contextmenu = {
          disabled = {
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
          menu = {
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
          selected = {
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
        };

        downloads = {
          bar.bg = config.colorscheme.bg .0;
          error = {
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
          start = {
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
          stop = {
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
          system = {
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
        };

        hints = {
          bg = config.colorscheme.bg .0;
          fg = config.colorscheme.bg .0;
          match.fg = config.colorscheme.bg .0;
        };

        keyhint = {
          fg = config.colorscheme.bg .0;
          bg = config.colorscheme.bg .0;
          suffix = {
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
        };

        messages = {
          error = {
            border = config.colorscheme.bg .0;
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
          info = {
            border = config.colorscheme.bg .0;
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
          warning = {
            border = config.colorscheme.bg .0;
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
        };

        prompts = {
          border = config.colorscheme.bg .0;
          fg = config.colorscheme.bg .0;
          bg = config.colorscheme.bg .0;
          selected = {
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
        };

        statusbar = {
          caret = {
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
            selection = {
              fg = config.colorscheme.bg .0;
              bg = config.colorscheme.bg .0;
            };
            command = {
              fg = config.colorscheme.bg .0;
              bg = config.colorscheme.bg .0;
              private = {
                fg = config.colorscheme.bg .0;
                bg = config.colorscheme.bg .0;
              };
            };
          };
          insert = {
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
          normal = {
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
          passthrough = {
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
          private = {
            fg = config.colorscheme.bg .0;
            bg = config.colorscheme.bg .0;
          };
          progress.bg = config.colorscheme.bg .0;
          url = {
            error.fg = config.colorscheme.bg .0;
            fg = config.colorscheme.bg .0;
            hover.fg = config.colorscheme.bg .0;
            success = {
              http.fg = config.colorscheme.bg .0;
              https.fg = config.colorscheme.bg .0;
            };
            warn.fg = config.colorscheme.bg .0;
          };
        };

        tabs = {
          bar.bg = config.colorscheme.bg .0;
          even = {
            bg = config.colorscheme.bg .0;
            fg = config.colorscheme.bg .0;
          };
          indicator = {
            error = config.colorscheme.bg .0;
            start = config.colorscheme.bg .0;
            stop = config.colorscheme.bg .0;
            system = config.colorscheme.bg .0;
          };
          odd = {
            bg = config.colorscheme.bg .0;
            fg = config.colorscheme.bg .0;
          };
          pinned = {
            even = {
              bg = config.colorscheme.bg .0;
              fg = config.colorscheme.bg .0;
            };
            odd = {
              bg = config.colorscheme.bg .0;
              fg = config.colorscheme.bg .0;
            };
            selected = {
              even = {
                bg = config.colorscheme.bg .0;
                fg = config.colorscheme.bg .0;
              };
              odd = {
                bg = config.colorscheme.bg .0;
                fg = config.colorscheme.bg .0;
              };
            };
          };
          selected = {
            even = {
              bg = config.colorscheme.bg .0;
              fg = config.colorscheme.bg .0;
            };
            odd = {
              bg = config.colorscheme.bg .0;
              fg = config.colorscheme.bg .0;
            };
          };
        };

        tooltip = {
          bg = config.colorscheme.bg .0;
          fg = config.colorscheme.bg .0;
        };

        webpage = {
          bg = config.colorscheme.bg .0;
          preferred_color_scheme = config.colorscheme.bg .0;
          darkmode = {
            algorithm = config.colorscheme.bg .0;
            contrast = config.colorscheme.bg .0;
            enabled = config.colorscheme.bg .0;
            policy = {
              images = config.colorscheme.bg .0;
              page = config.colorscheme.bg .0;
            };
            threshold = {
              background = config.colorscheme.bg .0;
              foreground = config.colorscheme.bg .0;
            };
          };
        };
      };
    };
  };
}

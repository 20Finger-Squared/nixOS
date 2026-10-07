{ colourscheme, ... }:
{
  programs.qutebrowser = {
    enable = true;
    enableDefaultBindings = true;
    loadAutoconfig = false;
    aliases = {
      "w" = "session-save";
      "q" = "close";
      "qa" = "quit";
      "wq" = "quit --save";
      "wqa" = "quit --save";
    };

    settings =
      let
        colourscheme_hex = builtins.mapAttrs (_: value: "#${value}") colourscheme;
      in
      {
        backend = "webengine";
        confirm_quit = [ "downloads" ];
        new_instance_open_target_window = "last-focused";

        prompt.radius = 0;
        fileselect.handler = "default";
        qt.chromium.low_end_device_mode = "auto";

        auto_save = {
          interval = 15000;
          session = true;
        };

        colors =
          let
            fg = colourscheme_hex.base07;
            bg = colourscheme_hex.base00;
          in
          rec {
            completion = {
              match.fg = colourscheme_hex.base0A;

              even.bg = colourscheme_hex.base02;
              odd.bg = colourscheme_hex.base01;

              category = {
                fg = fg;
                bg = "qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 ${colourscheme_hex.base09}, stop:1 ${colourscheme_hex.base08})";
                border = {
                  bottom = bg;
                  top = bg;
                };
              };

              fg = [
                fg
                colourscheme_hex.base0C
                colourscheme_hex.base0E
              ];

              item.selected = {
                bg = colourscheme_hex.base01;
                fg = colourscheme_hex.base0A;
                border.bottom = colourscheme_hex.base0E;
                border.top = colourscheme_hex.base0E;
                match.fg = colourscheme_hex.base09;
              };

              scrollbar = {
                bg = colourscheme_hex.base03;
                fg = colourscheme_hex.base06;
              };
            };

            contextmenu = {
              disabled = {
                fg = colourscheme_hex.base05;
                bg = null;
              };

              menu = {
                fg = fg;
                bg = colourscheme_hex.base01;
              };

              selected = {
                fg = colourscheme_hex.base0A;
                bg = colourscheme_hex.base02;
              };

            };

            downloads = {
              bar.bg = colourscheme_hex.base01;

              error = {
                fg = fg;
                bg = colourscheme_hex.base08;
              };

              start = {
                fg = fg;
                bg = colourscheme_hex.base0C;
              };

              stop = {
                fg = fg;
                bg = colourscheme_hex.base0D;
              };

              system = {
                fg = "rgb";
                bg = "rgb";
              };

            };

            hints = {
              fg = colourscheme_hex.base01;
              bg = "qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 ${colourscheme_hex.base0A}, stop:1 ${colourscheme_hex.base0A})";
              match.fg = colourscheme_hex.base03;
            };

            keyhint = {
              fg = fg;
              bg = colourscheme_hex.base03;
              suffix.fg = colourscheme_hex.base08;
            };

            messages = {

              error = {
                fg = fg;
                bg = colourscheme_hex.base09;
                border = colourscheme_hex.base08;
              };

              info = {
                fg = colourscheme_hex.base0D;
                bg = colourscheme_hex.base01;
                border = colourscheme_hex.base02;
              };

              warning = {
                fg = colourscheme_hex.base09;
                bg = colourscheme_hex.base01;
                border = colourscheme_hex.base01;
              };

            };

            prompts = {
              fg = fg;
              bg = colourscheme_hex.base04;
              border = "3px solid ${colourscheme_hex.base02}";

              selected = {
                fg = fg;
                bg = colourscheme_hex.base01;
              };

            };

            statusbar = {

              caret = {
                fg = fg;
                bg = colourscheme_hex.base0E;

                selection = {
                  fg = fg;
                  bg = colourscheme_hex.base01;
                };
              };

              command = {
                bg = colourscheme_hex.base01;
                fg = fg;

                private = {
                  fg = fg;
                  bg = colourscheme_hex.base01;
                };
              };

              insert = {
                fg = colourscheme_hex.base01;
                bg = colourscheme_hex.base0D;
              };

              normal = {
                fg = fg;
                bg = colourscheme_hex.base01;
              };

              passthrough = {
                fg = colourscheme_hex.base01;
                bg = colourscheme_hex.base0E;
              };

              private = {
                fg = fg;
                bg = colourscheme_hex.base01;
              };

              progress.bg = colourscheme_hex.base01;

              url = {
                fg = fg;

                hover.fg = fg;

                warn.fg = colourscheme_hex.base0A;
                error.fg = colourscheme_hex.base08;

                success = {
                  http.fg = fg;
                  https.fg = fg;
                };
              };
            };

            tabs = {
              bar.bg = colourscheme_hex.base01;

              even = {
                fg = fg;
                bg = colourscheme_hex.base01;
              };

              odd = {
                fg = fg;
                bg = colourscheme_hex.base02;
              };

              pinned = {

                even = {
                  fg = tabs.even.fg;
                  bg = tabs.even.bg;
                };

                odd = {
                  fg = tabs.odd.fg;
                  bg = tabs.odd.bg;
                };

                selected = {
                  even = {
                    fg = tabs.selected.even.fg;
                    bg = tabs.selected.even.bg;
                  };

                  odd = {
                    fg = tabs.selected.odd.fg;
                    bg = tabs.selected.odd.bg;
                  };
                };
              };

              indicator = {
                start = bg;
                stop = colourscheme_hex.base03;
                error = colourscheme_hex.base08;
              };

              selected = {
                even = {
                  fg = bg;
                  bg = colourscheme_hex.base0A;
                };

                odd = {
                  fg = bg;
                  bg = colourscheme_hex.base0A;
                };
              };
            };

            tooltip = {
              fg = fg;
              bg = colourscheme_hex.base02;
            };

            webpage = {
              bg = bg;

              darkmode = {
                enabled = true;

                policy = {
                  images = "never";
                  page = "smart";
                };
              };

              preferred_color_scheme = "dark";
            };
          };

        completion = {
          cmd_history_max_items = 50;
          delay = 0;
          height = "80%";
          min_chars = 1;
          quick = true;
          show = "always";
          web_history.max_items = -1;

          scrollbar = {
            padding = 3;
            width = 14;
          };

          open_categories = [
            "searchengines"
            "quickmarks"
            "bookmarks"
            "history"
            "filesystem"
          ];
        };

        content = {
          autoplay = false;

          blocking = {
            enabled = true;
            method = "auto";

            hosts = {
              block_subdomains = true;
              lists = [ "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" ];
            };
          };

          cache.appcache = true;
          canvas_reading = true;
          cookies.store = true;
          default_encoding = "iso-8859-1";
          desktop_capture = "ask";
          dns_prefetch = true;
          frame_flattening = true;
          geolocation = false;
          headers.accept_language = "en-GB,en;q=0.9";

          javascript = {
            can_close_tabs = false;
            can_open_tabs_automatically = false;
            clipboard = "ask";
            enabled = true;
          };

          mouse_lock = false;
          mute = false;

          notifications = {
            enabled = "ask";
            presenter = "auto";
            show_origin = true;
          };

          pdfjs = false;
          persistent_storage = "ask";
          prefers_reduced_motion = true;
          print_element_backgrounds = true;
          site_specific_quirks.enabled = true;
          webgl = true;
        };

        downloads = {
          position = "bottom";
          location.prompt = true;
        };

        editor = {
          encoding = "utf-8";
          remove_file = true;
          command = [
            "nvim"
            "{file}"
            "-c"
            "normal {line}G{column0}l"
          ];
        };

        fonts = {

          completion = {
            category = "bold default_size default_family";
            entry = "default_size default_family";
          };

          downloads = "default_size default_family";
          hints = "bold default_size default_family";
          keyhint = "default_size default_family";

          messages = {
            error = "default_size default_family";
            info = "default_size default_family";
            warning = "default_size default_family";
          };

          prompts = "default_size sans-serif";
          statusbar = "default_size default_family";

          tabs = {
            selected = "default_size default_family";
            unselected = "default_size default_family";
          };

          tooltip = "default_size default_family";
        };

        hints = {
          border = "1px solid #${colourscheme_hex.base09}";
          leave_on_load = true;
          mode = "letter";
          scatter = true;
          padding = {
            "top" = 2;
            "bottom" = 2;
            "left" = 2;
            "right" = 2;
          };
        };

        input = {
          links_included_in_focus_chain = true;
          match_counts = true;
          media_keys = true;

          insert_mode = {
            auto_enter = true;
            auto_leave = false;
            auto_load = true;
          };
        };

        keyhint = {
          delay = 0;
          radius = 1;
        };

        tabs = {
          position = "left";
          show = "switching";
          width = "25%";

          show_switching_delay = 1000;

          tooltips = true;
          pinned.shrink = true;

          title = {
            alignment = "center";
            elide = "right";
          };
        };

        window = {
          hide_decoration = false;
          title_format = "{perc}{current_title}{title_sep}";
        };
      };
  };
}

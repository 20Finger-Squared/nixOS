{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.programs.dwm;

  defaultKeys = [
    {
      modifier = "MODKEY";
      key = "XK_b";
      function = "togglebar";
      argument = "{0}";
    }
    {
      modifier = "MODKEY";
      key = "XK_j";
      function = "focusstack";
      argument = "{.i = +1 }";
    }
    {
      modifier = "MODKEY";
      key = "XK_k";
      function = "focusstack";
      argument = "{.i = -1 }";
    }
    {
      modifier = "MODKEY";
      key = "XK_i";
      function = "incnmaster";
      argument = "{.i = +1 }";
    }
    {
      modifier = "MODKEY";
      key = "XK_d";
      function = "incnmaster";
      argument = "{.i = -1 }";
    }
    {
      modifier = "MODKEY";
      key = "XK_h";
      function = "setmfact";
      argument = "{.f = -0.05}";
    }
    {
      modifier = "MODKEY";
      key = "XK_l";
      function = "setmfact";
      argument = "{.f = +0.05}";
    }
    {
      modifier = "MODKEY";
      key = "XK_Return";
      function = "zoom";
      argument = "{0}";
    }
    {
      modifier = "MODKEY";
      key = "XK_Tab";
      function = "view";
      argument = "{0}";
    }
    {
      modifier = "MODKEY|ShiftMask";
      key = "XK_c";
      function = "killclient";
      argument = "{0}";
    }
    {
      modifier = "MODKEY";
      key = "XK_t";
      function = "setlayout";
      argument = "{.v = &layouts[0]}";
    }
    {
      modifier = "MODKEY";
      key = "XK_f";
      function = "setlayout";
      argument = "{.v = &layouts[1]}";
    }
    {
      modifier = "MODKEY";
      key = "XK_m";
      function = "setlayout";
      argument = "{.v = &layouts[2]}";
    }
    {
      modifier = "MODKEY";
      key = "XK_space";
      function = "setlayout";
      argument = "{0}";
    }
    {
      modifier = "MODKEY|ShiftMask";
      key = "XK_space";
      function = "togglefloating";
      argument = "{0}";
    }
    {
      modifier = "MODKEY";
      key = "XK_0";
      function = "view";
      argument = "{.ui = ~0 }";
    }
    {
      modifier = "MODKEY|ShiftMask";
      key = "XK_0";
      function = "tag";
      argument = "{.ui = ~0 }";
    }
    {
      modifier = "MODKEY";
      key = "XK_comma";
      function = "focusmon";
      argument = "{.i = -1 }";
    }
    {
      modifier = "MODKEY";
      key = "XK_period";
      function = "focusmon";
      argument = "{.i = +1 }";
    }
    {
      modifier = "MODKEY|ShiftMask";
      key = "XK_comma";
      function = "tagmon";
      argument = "{.i = -1 }";
    }
    {
      modifier = "MODKEY|ShiftMask";
      key = "XK_period";
      function = "tagmon";
      argument = "{.i = +1 }";
    }
    {
      modifier = "MODKEY|ShiftMask";
      key = "XK_q";
      function = "quit";
      argument = "{0}";
    }
  ];

  file = pkgs.writeText "config.h" /* c */ ''
    ${cfg.file.prepend}
    #define MODKEY ${cfg.modifier}
    #define TAGKEYS(KEY, TAG) \
        {${cfg.tagKeys.modifiers.viewOnlyThisTag},       KEY, view,       {.ui = 1 << TAG} }, \
        {${cfg.tagKeys.modifiers.toggleThisTagInView},   KEY, toggleview, {.ui = 1 << TAG} }, \
        {${cfg.tagKeys.modifiers.moveWindowToThisTag},   KEY, tag,        {.ui = 1 << TAG} }, \
        {${cfg.tagKeys.modifiers.toggleWindowOnThisTag}, KEY, toggletag,  {.ui = 1 << TAG} },
    #define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
    static const unsigned int borderpx = ${toString cfg.borderpx};
    static const unsigned int gappx    = ${toString cfg.patches.gaps.width};
    static const unsigned int snap     = ${toString cfg.snap};
    static const int showbar           = ${if cfg.showBar then "1" else "0"};
    static const int topbar            = ${if cfg.showBar then "1" else "0"};
    static const char *fonts[]         = { "${cfg.font.name}:size=${toString cfg.font.size}" };
    static const char *colors[][3] = { ${
      concatMapStringsSep ",\n" (color: ''
        [ ${color.scheme} ] = { "${color.fg}", "${color.bg}", "${color.border}" }
      '') cfg.colors
    } };

    static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
    static const char *dmenucmd[] = { "${cfg.appLauncher.appCmd}", ${
      concatMapStringsSep ", " (
        arg: ''"${toString arg.flag}", ${toString arg.argument}''
      ) cfg.appLauncher.appArgs
    }, NULL };

    static const char *termcmd[]  = { "${cfg.terminal.appCmd}", ${
      concatMapStringsSep ", " (
        arg: ''"${toString arg.flag}, ${toString arg.argument}"''
      ) cfg.terminal.appArgs
    } NULL };

    /* layout(s) */
    static const float mfact        = ${toString cfg.layout.mfact}; /* factor of master area size [0.05..0.95] */
    static const int nmaster        = ${toString cfg.layout.nmaster};    /* number of clients in master area */
    static const int resizehints    = ${toString cfg.layout.resizehints};    /* 1 means respect size hints in tiled resizals */
    static const int lockfullscreen = ${toString cfg.layout.lockfullscreen}; /* 1 will force focus on the fullscreen window */

    static const char *tags[] = { ${concatMapStringsSep ", " (tag: ''"${toString tag}"'') cfg.tags} };


    static const Layout layouts[] = {
    ${concatMapStringsSep ",\n " (
      layout: ''{"${layout.symbol}", ${layout.arrangeFunction}}''
    ) cfg.layout.layouts}
    };

    static const Rule rules[] = {
    ${concatMapStringsSep ",\n " (rule: ''
      {
      "${rule.class}", ${rule.instance}, ${rule.title}, ${toString rule.tagsMask}, ${
        if rule.isFloating then "1" else "0"
      }, ${toString rule.monitor}
      }
    '') cfg.rules}
    };

    static const Key keys[] = {
        {${cfg.terminal.modifier}, ${cfg.terminal.launchKey}, spawn, {.v=termcmd}},
        {${cfg.appLauncher.modifier}, ${cfg.appLauncher.launchKey}, spawn, {.v=dmenucmd}},

        ${
          concatMapStringsSep ",\n        " (
            key: ''{${key.modifier}, ${key.key}, ${key.function}, ${key.argument} }''
          ) (if cfg.key.useDefault then cfg.key.keys ++ defaultKeys else cfg.key.keys)
        },

        ${concatMapStringsSep "\n        " (
          tag: ''TAGKEYS(${tag.key}, ${toString tag.tag})''
        ) cfg.tagKeys.definitions}
    };

    static const Button buttons[] = {
        ${
          concatMapStringsSep ",\n        " (
            button: ''{${button.click},${button.mask},${button.button},${button.function},${button.argument}}''
          ) cfg.buttons
        },
    };

    ${cfg.file.append}
  '';

  dwm = pkgs.dwm.overrideAttrs (oldAttrs: {
    src = if cfg.package.src != null then cfg.package.src else oldAttrs.src;
    patches =
      (oldAttrs.patches or [ ])
      ++ cfg.package.patches
      ++ (if cfg.patches.gaps.enable then [ ./gaps.diff ] else [ ]);
    postPatch = "cp ${file} config.h; cp ${file} config.def.h";
  });

  types = lib.types // {
    hexColor = types.strMatching "^#[0-9a-fA-F]{6}([0-9a-fA-F]{2})?$";
    modifier = types.strMatching "^(MODKEY|Mod[1-5]Mask|ShiftMask|ControlMask|LockMask)(\\|(MODKEY|Mod[1-5]Mask|ShiftMask|ControlMask|LockMask))*$";
  };
in
{
  options.programs.dwm = {
    enable = mkEnableOption "dwm";
    patches = {
      gaps = {
        enable = mkEnableOption "gaps patch";
        width = mkOption {
          type = types.int;
          default = 1;
          description = "The width of the gaps between windows";
          example = 3;
        };
      };
    };

    tagKeys = {
      modifiers = {
        viewOnlyThisTag = mkOption {
          type = types.modifier;
          default = "MODKEY";
          example = "MODKEY";
        };
        toggleThisTagInView = mkOption {
          type = types.modifier;
          default = "MODKEY|ControlMask";
          example = "MODKEY";
        };
        moveWindowToThisTag = mkOption {
          type = types.modifier;
          default = "MODKEY|ShiftMask";
          example = "MODKEY";
        };
        toggleWindowOnThisTag = mkOption {
          type = types.modifier;
          default = "MODKEY|ControlMask|ShiftMask";
          example = "MODKEY";
        };
      };

      definitions = mkOption {
        type = types.listOf (
          types.submodule {
            options = {
              key = mkOption {
                type = types.str;
                default = "XK_1";
                example = "XK_9";
              };
              tag = mkOption {
                type = types.int;
                default = 0;
                example = 9;
              };
            };
          }
        );

        default = [
          {
            key = "XK_1";
            tag = 0;
          }
          {
            key = "XK_2";
            tag = 1;
          }
          {
            key = "XK_3";
            tag = 2;
          }
          {
            key = "XK_4";
            tag = 3;
          }
          {
            key = "XK_5";
            tag = 4;
          }
          {
            key = "XK_6";
            tag = 5;
          }
          {
            key = "XK_7";
            tag = 6;
          }
          {
            key = "XK_8";
            tag = 7;
          }
          {
            key = "XK_9";
            tag = 8;
          }
        ];
      };
    };

    showBar = mkOption {
      type = types.bool;
      default = true;
      example = false;
      description = "Whether to enable show bar";
    };

    topBar = mkOption {
      type = types.bool;
      default = true;
      example = false;
      description = "Whether to enable top bar if false then it's on the bottom";
    };

    buttons = mkOption {
      type = types.listOf (
        types.submodule {
          options = {
            click = mkOption { type = types.str; };
            mask = mkOption { type = types.str; };
            button = mkOption { type = types.str; };
            function = mkOption { type = types.str; };
            argument = mkOption { type = types.str; };
          };
        }
      );
      default = [
        {
          click = "ClkLtSymbol";
          mask = "0";
          button = "Button1";
          function = "setlayout";
          argument = "{0}";
        }
        {
          click = "ClkLtSymbol";
          mask = "0";
          button = "Button3";
          function = "setlayout";
          argument = "{.v = &layouts[2]}";
        }
        {
          click = "ClkWinTitle";
          mask = "0";
          button = "Button2";
          function = "zoom";
          argument = "{0}";
        }
        {
          click = "ClkStatusText";
          mask = "0";
          button = "Button2";
          function = "spawn";
          argument = "{.v = termcmd}";
        }
        {
          click = "ClkClientWin";
          mask = "MODKEY";
          button = "Button1";
          function = "movemouse";
          argument = "{0}";
        }
        {
          click = "ClkClientWin";
          mask = "MODKEY";
          button = "Button2";
          function = "togglefloating";
          argument = "{0}";
        }
        {
          click = "ClkClientWin";
          mask = "MODKEY";
          button = "Button3";
          function = "resizemouse";
          argument = "{0}";
        }
        {
          click = "ClkTagBar";
          mask = "0";
          button = "Button1";
          function = "view";
          argument = "{0}";
        }
        {
          click = "ClkTagBar";
          mask = "0";
          button = "Button3";
          function = "toggleview";
          argument = "{0}";
        }
        {
          click = "ClkTagBar";
          mask = "MODKEY";
          button = "Button1";
          function = "tag";
          argument = "{0}";
        }
        {
          click = "ClkTagBar";
          mask = "MODKEY";
          button = "Button3";
          function = "toggletag";
          argument = "{0}";
        }
      ];
    };

    font = {
      type = types.listOf types.str;
      name = mkOption {
        type = types.str;
        default = "monospace";
        example = "JetbrainsMono NF";
      };
      size = mkOption {
        type = types.int;
        default = 10;
        example = 12;
      };

      description = "Font for dwm";
    };

    file = {
      prepend = mkOption {
        type = types.str;
        default = "";
        description = "Custom config written in c to prepend to the file";
      };
      append = mkOption {
        type = types.str;
        default = "";
        description = "Custom config written in c to append to the file";
      };
    };

    package = {
      patches = mkOption {
        type = types.listOf types.path;
        default = [ ];
        description = "Custom patches to add to the dwm package";
      };
      src = mkOption {
        type = types.nullOr types.path;
        default = null;
        description = "Custom source for the dwm package";
      };
    };

    borderpx = mkOption {
      type = types.int;
      default = 1;
      example = 5;
      description = "border pixel of windows";
    };

    modifier = mkOption {
      type = types.modifier;
      default = "Mod1Mask";
      example = "Mod4Mask";
      description = "The default modifier for keybinds";
    };

    snap = mkOption {
      type = types.int;
      default = 32;
      example = 16;
      description = "snap pixel";
    };

    appLauncher = {
      modifier = mkOption {
        type = types.modifier;
        default = "MODKEY";
      };
      launchKey = mkOption {
        type = types.str;
        default = "XK_p";
      };
      appCmd = mkOption {
        type = types.str;
        default = "dmenu_run";
        example = "rofi";
        description = "The application launcher command";
      };
      appArgs = mkOption {
        type = types.listOf (
          types.submodule {
            options = {
              flag = mkOption {
                type = types.str;
                description = "The flag or argument name";
              };
              argument = mkOption {
                type = types.str;
                description = "The value for the flag";
              };
            };
          }
        );
        default = [
          {
            flag = "-m";
            argument = "dmenumon";
          }
          {
            flag = "-fn";
            argument = ''"monospace:size=10"'';
          }
          {
            flag = "-nb";
            argument = ''"#222222"'';
          }
          {
            flag = "-nf";
            argument = ''"#bbbbbb"'';
          }
          {
            flag = "-sb";
            argument = ''"#005577"'';
          }
          {
            flag = "-sf";
            argument = ''"#eeeeee"'';
          }
        ];
        example = ''
          [
            { flag = "-m"; argument = "0"; }
          ]
        '';
        description = "Arguments to pass to the application launcher command";
      };
    };

    terminal = {
      modifier = mkOption {
        type = types.modifier;
        default = "MODKEY|ShiftMask";
      };
      launchKey = mkOption {
        type = types.str;
        default = "XK_Return";
      };

      appCmd = mkOption {
        type = types.str;
        default = "st";
        example = "kitty";
        description = "The terminal command to launch";
      };
      appArgs = mkOption {
        type = types.listOf (
          types.submodule {
            options = {
              flag = mkOption {
                type = types.str;
                description = "The flag or argument name";
              };
              argument = mkOption {
                type = types.str;
                description = "The value for the flag";
              };
            };
          }
        );
        default = [ ];
        example = ''
          [
            { flag = "-e"; argument = "nvim"; }
          ]
        '';
        description = "Arguments to pass to the terminal command";
      };
    };

    layout = {
      mfact = mkOption {
        type = types.float;
        default = 0.55;
        example = "0.70";
        description = "factor of master area size [0.05..0.95]";
      };
      nmaster = mkOption {
        type = types.int;
        default = 1;
        example = 2;
        description = "number of clients in master area";
      };
      resizehints = mkOption {
        type = types.int;
        default = 1;
        example = 0;
        description = "1 means respect size hints in tiled resizals";
      };
      lockfullscreen = mkOption {
        type = types.int;
        default = 1;
        example = 0;
        description = "1 will force focus on the fullscreen window";
      };

      layouts = mkOption {
        type = types.listOf (
          types.submodule {
            options = {
              symbol = mkOption { type = types.str; };
              arrangeFunction = mkOption { type = types.str; };
            };
          }
        );
        default = [
          {
            symbol = "[]=";
            arrangeFunction = "tile";
          }
          {
            symbol = "><>";
            arrangeFunction = "NULL";
          }
          {
            symbol = "[M]";
            arrangeFunction = "monocle";
          }
        ];
        example = ''
          {
            symbol = "[]=";
            arrageFunction = "tile";
          }
        '';
        description = "The layout definitions";
      };
    };

    colors =
      mapAttrs
        (
          name: default:
          mkOption {
            type = types.submodule {
              options = {
                fg = mkOption { type = types.hexColor; };
                bg = mkOption { type = types.hexColor; };
                border = mkOption { type = types.hexColor; };
              };
            };
            inherit default;
          }
        )
        {
          SchemeNorm = {
            fg = "#bbbbbb";
            bg = "#222222";
            border = "#444444";
          };
          SchemeSel = {
            fg = "#eeeeee";
            bg = "#005577";
            border = "#005577";
          };
        };

    rules = mkOption {
      type = types.listOf (
        types.submodule {
          options = {
            class = mkOption {
              type = types.str;
              default = "NULL";
            };
            instance = mkOption {
              type = types.str;
              default = "NULL";
            };
            title = mkOption {
              type = types.str;
              default = "NULL";
            };
            tagsMask = mkOption {
              type = types.int;
              default = 0;
            };
            isFloating = mkEnableOption "make window floating";
            monitor = mkOption {
              type = types.int;
              default = -1;
            };
          };
        }
      );
      example = ''
        {
          class = "Gimp";
          instance = "NULL";
          title = "NULL";
          tagsMask = 0;
          isFloating = true;
          monitor = -1;
        }
      '';
      description = "The rules for specfic windows to follow.";
      default = [
        {
          class = "Gimp";
          instance = "NULL";
          title = "NULL";
          tagsMask = 0;
          isFloating = true;
          monitor = -1;
        }
        {
          class = "Firefox";
          instance = "NULL";
          title = "NULL";
          tagsMask = 256;
          isFloating = false;
          monitor = -1;
        }
      ];
    };

    key = {
      useDefault = mkOption {
        type = types.bool;
        default = true;
        example = false;
        description = "Create default key config, best if you don't want to manually define all keys";
      };

      keys = mkOption {
        type = types.listOf (
          types.submodule {
            options = {
              modifier = mkOption {
                type = types.modifier;
                default = "MODKEY";
                description = "If left unbound will use default modifier";
              };
              key = mkOption {
                type = types.str;
                default = "XK_p";
                description = "Uses X11 keys remember that SHIFT will modify the keycode";
              };
              function = mkOption {
                type = types.str;
                default = "spawn";
                description = "The function to call once the keybind is pressed";
              };
              argument = mkOption {
                type = types.str;
                default = ".v = dmenucmd";
                description = "The argument for the function";
              };
            };
          }
        );
        description = "The definitions for keybindings";
        default = [ ];
        example = ''
          {
            modifier = "MODKEY|ShiftMask";
            key = "XK_q";
            function = "quit";
            argument = "0";
          }
        '';
      };
    };

    tags = mkOption {
      type = types.listOf types.int;
      default = [
        1
        2
        3
        4
        5
        6
        7
        8
        9
      ];
      description = "The workspace numbers or 'tags'";
      example = " [ 1 ]; ";
    };
  };
  config = mkIf cfg.enable {
    system.build.dwm-config = file;
    services = {
      libinput.enable = true;
      xserver = {
        enable = true;
        windowManager.dwm = {
          enable = true;
          package = dwm;
        };
      };
    };
  };
}

{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.services.my-dwm;
  file = pkgs.writeText "config.h" ''
    static const unsigned int borderpx = ${toString cfg.borderpx};
    static const unsigned int snap = ${toString cfg.snap};
    static const unsigned int showbar = ${if cfg.showBar then "1" else "0"};
    static const unsigned int topbar = ${if cfg.topBar then "1" else "0"};

    static const char *colors[][3] = {
        ${concatMapStringsSep "\n    " (
          colors:
          ''[${toString colors.scheme}] = { "${toString colors.fg}", "${toString colors.bg}", "${toString colors.border}" },''
        ) cfg.colors}
      };

    static const char *tags[] = { ${concatMapStringsSep ", " (tag: ''"${toString tag}"'') cfg.tags} };

    static const Rule rules[] = {
            ${concatMapStringsSep "\n    " (
              rule:
              ''{ "${toString rule.class}", ${toString rule.instance}, ${toString rule.title}, ${toString rule.tagsMask}, ${
                if rule.isFloating then "1" else "0"
              }, ${toString rule.monitor} },''
            ) cfg.rules}
        };
    static const unsigned int mfact          = ${toString cfg.layout.mfact};
    static const unsigned int nmaster        = ${toString cfg.layout.nmaster};
    static const unsigned int resizehints    = ${toString cfg.layout.resizehints};
    static const unsigned int lockfullscreen = ${toString cfg.layout.lockfullscreen};
    static const unsigned int refreshrate    = ${toString cfg.layout.refreshrate};

    static const Layout layouts[] = {
        ${concatMapStringsSep "\n    " (
          layout: ''{ "${layout.symbol}", ${layout.arrageFunction} },''
        ) cfg.layout.layouts}
      };

    #define MODKEY ${cfg.modifier}
    #define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
    #define AltMODKEY MODKEY|ShiftMask
    #define TAGKEYS(KEY,TAG) \
    { MODKEY,                       KEY, view,       {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask,           KEY, toggleview, {.ui = 1 << TAG} }, \
    { AltMODKEY,                    KEY, tag,        {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask|ShiftMask, KEY, toggletag,  {.ui = 1 << TAG} },

    /* commands */
    static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
    static const char *dmenucmd[] = {
        "dmenu_run",
        "-m", dmenumon,
        "-fn", "${cfg.dmenu.font.name}:size=${toString cfg.dmenu.font.size}",
        "-nb", "${cfg.dmenu.colors.bg}",
        "-nf", "${cfg.dmenu.colors.fg}",
       "-sb",  "${cfg.dmenu.colors.selected.bg}",
        "-sf", "${cfg.dmenu.colors.selected.fg}", NULL };
    static const char *termcmd[]  = { "kitty", NULL };


    static const Key keys[] = {
        ${concatMapStringsSep "\n    " (
          key: ''{ ${key.modifier}, ${key.key}, ${key.function}, {${key.argument}} },''
        ) cfg.keys}
        TAGKEYS(XK_1, 0)
        TAGKEYS(XK_2, 1)
        TAGKEYS(XK_3, 2)
        TAGKEYS(XK_4, 3)
        TAGKEYS(XK_5, 4)
        TAGKEYS(XK_6, 5)
        TAGKEYS(XK_7, 6)
        TAGKEYS(XK_8, 7)
        TAGKEYS(XK_9, 8)
        };
  '';
  dwm = pkgs.dwm.overrideAttrs (oldAttrs: {
    postUnpack = " cp ${file} config.h ";
  });

  types = lib.types // {
    hexColor = types.strMatching "^#[0-9a-fA-F]{6}([0-9a-fA-F]{2})?$";
  };
in
{
  options.services.my-dwm = {
    enable = mkEnableOption "my-dwm";
    borderpx = mkOption {
      type = types.int;
      default = 3;
      example = 5;
      description = "The value for which is the thickness of a border in pixels.";
    };

    modifier = mkOption {
      type = types.str;
      default = "Mod4Mask";
      example = "Mod1Mask";
      description = "The default modifier for keybinds";
    };

    snap = mkOption {
      type = types.int;
      default = 32;
      example = 16;
      description = "The value for the points windows snap to.";
    };

    dmenu = {
      font = {
        name = mkOption {
          type = types.str;
          default = "JetbrainsMono NF";
          example = "FiraCode";
          description = "Font name";
        };
        size = mkOption {
          type = types.int;
          default = 10;
          example = 12;
          description = "The font size";
        };
      };

      enable = mkOption {
        type = types.bool;
        default = true;
        example = false;
        description = ''
          If you aren't using dmenu disable this as dmenu
          requires another variable to be stored.
          If not disabled it won't break anything,
          it'll just do nothing.
        '';
      };
      monitor = mkOption {
        type = types.int;
        default = Null;
        example = -1;
        description = ''
          What monitor to force dmenu to spawn on.
          If not set will use default dwm behavior.
        '';
      };

      colors = {
        bg = mkOption {
          type = types.hexColor;
          default = "#1D2021";
          example = "#fff";
          description = "The default bg for dmenu";
        };
        fg = mkOption {
          type = types.hexColor;
          default = "#32302F";
          example = "#fff";
          description = "The default fg for dmenu";
        };
        selected = {
          bg = mkOption {
            type = types.hexColor;
            default = "#3C3836";
            example = "#fff";
            description = "The default selected bg for dmenu";
          };
          fg = mkOption {
            type = types.hexColor;
            default = "#EBDBB2";
            example = "#fff";
            description = "The default selected fg for dmenu";
          };
        };
      };
    };

    showBar = mkEnableOption "show bar";
    topBar = mkEnableOption "top bar";
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
      refreshrate = mkOption {
        type = types.int;
        default = 120;
        example = 60;
        description = "refresh rate (per second) for client move/resize";
      };

      layouts = mkOption {
        type = types.listOf (
          types.submodule {
            options = {
              symbol = mkOption { type = types.str; };
              arrageFunction = mkOption { type = types.str; };
            };
          }
        );
        default = [
          {
            symbol = "[]=";
            arrageFunction = "tile";
          }
          {
            symbol = "><>";
            arrageFunction = "NULL";
          }
          {
            symbol = "[M]";
            arrageFunction = "monocle";
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

    colors = mkOption {
      type = types.listOf (
        types.submodule {
          options = {
            scheme = mkOption { type = types.str; };
            fg = mkOption { type = types.hexColor; };
            bg = mkOption { type = types.hexColor; };
            border = mkOption { type = types.hexColor; };
          };
        }
      );
      example = ''
        {
           scheme = "SchemeNorm";
           fg = "#FBF1C7";
           bg = "#1D2021";
           border = "#32302F";
        }
      '';
      default = [
        {

          scheme = "SchemeNorm";
          fg = "#FBF1C7";
          bg = "#1D2021";
          border = "#32302F";
        }
        {
          scheme = "SchemeSel";
          fg = "#D5C4A1";
          bg = "#D79921";
          border = "#D79921";
        }
      ];
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

    keys = mkOption {
      type = types.listOf (
        types.submodule {
          options = {
            modifier = mkOption {
              type = types.str;
              default = "MODKEY";
              description = "If left unbound will use default modifier";
            };
            key = mkOption {
              type = types.str;
              default = "XK_d";
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
      default = [
        {
          modifier = "MODKEY";
          key = "XK_d";
          function = "spawn";
          argument = ".v = dmenucmd";
        }
        {
          modifier = "MODKEY";
          key = "XK_t";
          function = "spawn";
          argument = ".v = termcmd";
        }
        {
          modifier = "MODKEY";
          key = "XK_b";
          function = "togglebar";
          argument = "0";
        }
        {
          modifier = "MODKEY";
          key = "XK_j";
          function = "focusstack";
          argument = ".i = +1";
        }
        {
          modifier = "MODKEY";
          key = "XK_k";
          function = "focusstack";
          argument = ".i = -1";
        }
        {
          modifier = "AltMODKEY";
          key = "XK_J";
          function = "incnmaster";
          argument = ".i = +1";
        }
        {
          modifier = "AltMODKEY";
          key = "XK_K";
          function = "incnmaster";
          argument = ".i = -1";
        }
        {
          modifier = "MODKEY";
          key = "XK_h";
          function = "setmfact";
          argument = ".f = -0.05";
        }
        {
          modifier = "MODKEY";
          key = "XK_l";
          function = "setmfact";
          argument = ".f = +0.05";
        }
        {
          modifier = "MODKEY";
          key = "XK_Return";
          function = "zoom";
          argument = "0";
        }
        {
          modifier = "MODKEY";
          key = "XK_Tab";
          function = "view";
          argument = "0";
        }
        {
          modifier = "AltMODKEY";
          key = "XK_Q";
          function = "killclient";
          argument = "0";
        }
        {
          modifier = "MODKEY";
          key = "XK_i";
          function = "setlayout";
          argument = ".v = &layouts[0]";
        }
        {
          modifier = "MODKEY";
          key = "XK_f";
          function = "setlayout";
          argument = ".v = &layouts[1]";
        }
        {
          modifier = "MODKEY";
          key = "XK_m";
          function = "setlayout";
          argument = ".v = &layouts[2]";
        }
        {
          modifier = "MODKEY";
          key = "XK_space";
          function = "setlayout";
          argument = "0";
        }
        {
          modifier = "AltMODKEY";
          key = "XK_space";
          function = "togglefloating";
          argument = "0";
        }
        {
          modifier = "MODKEY";
          key = "XK_0";
          function = "view";
          argument = ".ui = ~0";
        }
        {
          modifier = "AltMODKEY";
          key = "XK_0";
          function = "tag";
          argument = ".ui = ~0";
        }
        {
          modifier = "MODKEY";
          key = "XK_comma";
          function = "focusmon";
          argument = ".i = -1";
        }
        {
          modifier = "MODKEY";
          key = "XK_period";
          function = "focusmon";
          argument = ".i = +1";
        }
        {
          modifier = "AltMODKEY";
          key = "XK_comma";
          function = "tagmon";
          argument = ".i = -1";
        }
        {
          modifier = "AltMODKEY";
          key = "XK_period";
          function = "tagmon";
          argument = ".i = +1";
        }
        {
          modifier = "AltMODKEY";
          key = "XK_Escape";
          function = "quit";
          argument = "0";
        }
      ];
      description = "The definitions for keybindings";
      example = ''
        {
          modifier = "AltMODKEY";
          key = "XK_Escape";
          function = "quit";
          argument = "0";
        }
      '';
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

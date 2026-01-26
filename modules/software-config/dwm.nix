{
  pkgs,
  my-pkgs,
  config,
  colorscheme,
  lib,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.programs.dwm;
  modifer = cfg.modifier;
  XF86AudioLowerVolume = "0x1008ff11";
  XF86AudioMuteVolume = "0x1008ff12";
  XF86AudioRaiseVolume = "0x1008ff13";
  volumeIncrement = 0.05;
in
{
  options.software-config.dwm.enable = mkEnableOption "my dwm config";
  config = mkIf config.software-config.dwm.enable {
    environment.systemPackages = [
      my-pkgs.dwm-script
      pkgs.feh
    ];
    programs.dwm = {
      enable = true;
      modifier = "Mod4Mask";
      snap = 16;
      borderpx = 3;
      terminal = {
        launchKey = "XK_space";
        modifier = "${modifer}";
        appCmd = "st";
      };
      font = {
        size = 12;
        name = "JetbrainsMono NF";
      };
      appLauncher = {
        appCmd = "dmenu_run";
        launchKey = "XK_Tab";
        appArgs = [
          {
            flag = "-c";
          }
          {
            flag = "-m";
            argument = ''dmenumon'';
          }
          {
            flag = "-p";
            argument = ''"run:"'';
          }
          {
            flag = "-fn";
            argument = ''"${cfg.font.name}:size=14"'';
          }
        ];
      };
      colors = [
        {
          name = "SchemeNorm";
          fg = "#${colorscheme.base05}";
          bg = "#${colorscheme.base00}";
          border = "#${colorscheme.base03}";
        }
        {
          name = "SchemeSel";
          fg = "#${colorscheme.base0A}";
          bg = "#${colorscheme.base02}";
          border = "#${colorscheme.base0A}";
        }
      ];

      key = {
        useDefault = false;
        keys = [
          {
            modifier = 0;
            key = XF86AudioRaiseVolume;
            function = "spawn";
            argument = ''SHCMD("wpctl set-volume @DEFAULT_AUDIO_SINK@ ${toString volumeIncrement}+")'';
          }
          {
            modifier = 0;
            key = XF86AudioLowerVolume;
            function = "spawn";
            argument = ''SHCMD("wpctl set-volume @DEFAULT_AUDIO_SINK@ ${toString volumeIncrement}-")'';
          }
          {
            modifier = 0;
            key = XF86AudioMuteVolume;
            function = "spawn";
            argument = ''SHCMD("wpctl mute @DEFAULT_AUDIO_SINK@ toggle")'';
          }
          {
            modifier = "MODKEY|ShiftMask";
            key = "XK_Tab";
            function = "view";
            argument = "{0}";
          }
          {
            modifier = "MODKEY";
            key = "XK_BackSpace";
            function = "setlayout";
            argument = "{0}";
          }
          {
            modifier = "MODKEY|ShiftMask";
            key = "XK_BackSpace";
            function = "togglefloating";
            argument = "{0}";
          }

          # custom keys bellow
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
      };
    };
  };
}

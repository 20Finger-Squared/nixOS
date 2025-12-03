{ config, ... }:
let
  colorscheme = config.colorscheme;
  modifer = config.programs.dwm.modifier;
in
{
  enable = true;
  modifier = "Mod4Mask";
  terminal.launchKey = "XK_space";
  terminal.modifier = "${modifer}";
  terminal.appCmd = "kitty";
  appLauncher.appArgs = [
    {
      flag = "-m";
      argument = "dmenumon";
    }
    {
      flag = "-p";
      argument = ''"run:"'';
    }
  ];
  layout.mfact = 0.60;
  snap = 16;
  borderpx = 3;
  patches.gaps = {
    enable = true;
    width = 8;
  };
  colors = {
    SchemeNorm = {
      fg = "#${colorscheme.base05}";
      bg = "#${colorscheme.base00}";
      border = "#${colorscheme.base03}";
    };
    SchemeSel = {
      fg = "#${colorscheme.base0A}";
      bg = "#${colorscheme.base02}";
      border = "#${colorscheme.base0A}";
    };
  };
  key = {
    useDefault = false;
    keys = [
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
        modifier = "MODKEY|ShiftMask";
        key = "XK_Return";
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
  };
}

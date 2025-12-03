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
}

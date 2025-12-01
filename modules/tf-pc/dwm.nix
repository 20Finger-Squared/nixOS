{ config, ... }:
let
  colorscheme = config.colorscheme;
in
{
  enable = true;
  modifier = "Mod4Mask";
  terminal.appCmd = "kitty";
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

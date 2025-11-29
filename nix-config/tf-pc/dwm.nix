{ config, ... }:
let
  colorscheme = config.colorscheme;
in
{
  enable = true;
  modifier = "Mod4Mask";
  terminal.appCmd = "kitty";
  layout.mfact = 0.70;
  snap = 16;
  borderpx = 3;
  patches.gaps = {
    enable = true;
    width = 6;
  };

  colors = [
    {
      scheme = "SchemeNorm";
      fg = "${colorscheme.hex.fg.three}";
      bg = "${colorscheme.hex.bg.one}";
      border = "${colorscheme.hex.bg.four}";
    }
    {
      scheme = "SchemeSel";
      fg = "${colorscheme.hex.muted.yellow}";
      bg = "${colorscheme.hex.bg.soft}";
      border = "${colorscheme.hex.muted.yellow}";
    }
  ];
}

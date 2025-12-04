{ config, ... }:
let
  colors = config.colorscheme;
in
{
  programs.dmenu = {
    enable = true;
    lines = 5;
    patches.inlinePrompt = {
      enable = true;
      schemePrompt = {
        fg = "#${colors.base04}";
        bg = "#${colors.base00}";
      };
    };
    colors = {
      SchemeNorm = {
        fg = "#${colors.base04}";
        bg = "#${colors.base00}";
      };
      SchemeSel = {
        fg = "#${colors.base0A}";
        bg = "#${colors.base00}";
      };
    };
  };
}

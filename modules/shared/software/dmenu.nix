{ config, ... }:
let
  colors = config.colorscheme;
in
{
  programs.dmenu = {
    enable = true;
    lines = 10;
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
    patches = {
      centered = {
        enable = true;
        centered = false;
        menu_height_ratio = 2.0;
        min_width = 800;
      };
      inlinePrompt = {
        enable = true;
        schemePrompt = {
          fg = "#${colors.base04}";
          bg = "#${colors.base00}";
        };
      };
    };
  };
}

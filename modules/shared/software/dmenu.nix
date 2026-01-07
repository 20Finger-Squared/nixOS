{ colorscheme, ... }:
{
  programs.dmenu = {
    enable = true;
    lines = 10;
    colors = {
      SchemeNorm = {
        fg = "#${colorscheme.base04}";
        bg = "#${colorscheme.base00}";
      };
      SchemeSel = {
        fg = "#${colorscheme.base0A}";
        bg = "#${colorscheme.base00}";
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
          fg = "#${colorscheme.base04}";
          bg = "#${colorscheme.base00}";
        };
      };
    };
  };
}

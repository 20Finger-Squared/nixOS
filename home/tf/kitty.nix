{ colorscheme, ... }:
{
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono NF";
    font.size = 13;
    shellIntegration.enableBashIntegration = true;

    settings = {
      background = "#${colorscheme.base00}";
      foreground = "#${colorscheme.base06}";
      cursor = "#${colorscheme.base06}";
      selection_background = "#${colorscheme.base01}";
      selection_foreground = "#${colorscheme.base06}";

      color0 = "#${colorscheme.base00}";
      color1 = "#${colorscheme.base08}";
      color2 = "#${colorscheme.base0B}";
      color3 = "#${colorscheme.base0A}";
      color4 = "#${colorscheme.base0D}";
      color5 = "#${colorscheme.base0E}";
      color6 = "#${colorscheme.base0C}";
      color7 = "#${colorscheme.base04}";

      color8 = "#${colorscheme.base07}";
      color9 = "#${colorscheme.base08}";
      color10 = "#${colorscheme.base0B}";
      color11 = "#${colorscheme.base0A}";
      color12 = "#${colorscheme.base0D}";
      color13 = "#${colorscheme.base0E}";
      color14 = "#${colorscheme.base0C}";
      color15 = "#${colorscheme.base04}"; # No close match in baseXX for #ebdbb2 (base06 is different
    };
    extraConfig = ''
      input_delay 0
      sync_to_monitor yes
      window_border_width 0
      window_padding_width 0
      background_opacity 0.3
      dynamic_background_opacity yes
      confirm_os_window_close 0
    '';
  };
}

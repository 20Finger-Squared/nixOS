{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono NF";
    font.size = 11;
    shellIntegration.enableBashIntegration = true;

    settings = {
      background = "#282828";
      foreground = "#ebdbb2";
      cursor = "#ebdbb2";
      selection_background = "#3c3836";
      selection_foreground = "#ebdbb2";

      color0 = "#282828";
      color1 = "#cc241d";
      color2 = "#98971a";
      color3 = "#d79921";
      color4 = "#458588";
      color5 = "#b16286";
      color6 = "#689d6a";
      color7 = "#a89984";

      color8 = "#928374";
      color9 = "#fb4934";
      color10 = "#b8bb26";
      color11 = "#fabd2f";
      color12 = "#83a598";
      color13 = "#d3869b";
      color14 = "#8ec07c";
      color15 = "#ebdbb2";
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

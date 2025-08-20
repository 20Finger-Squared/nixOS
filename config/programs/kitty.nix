{ lib, ... }:
{
  # Kitty terminal with Gruvbox theme and JetBrains Mono NF
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      # Gruvbox colors
      background_opacity = lib.mkForce 0.90;
      background = "#282828";
      foreground = "#ebdbb2";

      # Normal colors
      color0 = "#282828"; # black
      color1 = "#cc241d"; # red
      color2 = "#98971a"; # green
      color3 = "#d79921"; # yellow
      color4 = "#458588"; # blue
      color5 = "#b16286"; # magenta
      color6 = "#689d6a"; # cyan
      color7 = "#a89984"; # white

      # Bright colors
      color8 = "#928374"; # bright black
      color9 = "#fb4934"; # bright red
      color10 = "#b8bb26"; # bright green
      color11 = "#fabd2f"; # bright yellow
      color12 = "#83a598"; # bright blue
      color13 = "#d3869b"; # bright magenta
      color14 = "#8ec07c"; # bright cyan
      color15 = "#ebdbb2"; # bright white

      # Font configuration
      font_family = "JetBrainsMono Nerd Font";
      bold_font = "JetBrainsMono Nerd Font Bold";
      italic_font = "JetBrainsMono Nerd Font Italic";
      bold_italic_font = "JetBrainsMono Nerd Font Bold Italic";
      font_size = 14;

      # Window padding
      window_padding_width = 10;
    };
  };
}

{ config, nix-colors, ... }:
{
# Kitty terminal with Gruvbox theme and JetBrains Mono NF
    programs.kitty = {
        enable = true;
        settings = {
            foreground = "#${config.colorScheme.palette.base05}";
            background = "#${config.colorScheme.palette.base00}";
# Terminal colors
            color0 = "#${config.colorScheme.palette.base00}";
            color1 = "#${config.colorScheme.palette.base08}";
            color2 = "#${config.colorScheme.palette.base0B}";
            color3 = "#${config.colorScheme.palette.base0A}";
            color4 = "#${config.colorScheme.palette.base0D}";
            color5 = "#${config.colorScheme.palette.base0E}";
            color6 = "#${config.colorScheme.palette.base0C}";
            color7 = "#${config.colorScheme.palette.base05}";
            color8 = "#${config.colorScheme.palette.base03}";
            color9 = "#${config.colorScheme.palette.base08}";
            color10 = "#${config.colorScheme.palette.base0B}";
            color11 = "#${config.colorScheme.palette.base0A}";
            color12 = "#${config.colorScheme.palette.base0D}";
            color13 = "#${config.colorScheme.palette.base0E}";
            color14 = "#${config.colorScheme.palette.base0C}";
            color15 = "#${config.colorScheme.palette.base06}";
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

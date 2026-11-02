{
  colourscheme,
  lib,
  config,
  ...
}:
{
  options.home-manager-config.kitty = lib.mkEnableOption "My home-manager kitty config";
  config = lib.mkIf config.home-manager-config.kitty {
    programs.kitty = {
      enable = true;

      font = {
        name = "JetBrainsMono Nerd Font";
        size = 14;
      };

      settings = {
        background_opacity = 0.95;
        remember_window_size = false;

        repaint_delay = 1;
        input_delay = 1;
        sync_to_monitor = true;

        enable_audio_bell = false;

        foreground = colourscheme.white;
        background = colourscheme.bg;
        selection_foreground = colourscheme.bg;
        selection_background = colourscheme.white;

        cursor = colourscheme.white;
        cursor_text_color = colourscheme.bg;

        color0 = colourscheme.bg;
        color1 = colourscheme.red;
        color2 = colourscheme.green;
        color3 = colourscheme.yellow;
        color4 = colourscheme.blue;
        color5 = colourscheme.magenta;
        color6 = colourscheme.cyan;
        color7 = colourscheme.white;

        color8 = colourscheme.light-gray;
        color9 = colourscheme.bright-red;
        color10 = colourscheme.bright-green;
        color11 = colourscheme.bright-yellow;
        color12 = colourscheme.bright-blue;
        color13 = colourscheme.bright-magenta;
        color14 = colourscheme.bright-cyan;
        color15 = colourscheme.lighter-white;
      };
    };
  };
}

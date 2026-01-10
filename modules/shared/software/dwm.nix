{
  config,
  colorscheme,
  ...
}:
let
  cfg = config.programs.dwm;
  modifer = cfg.modifier;
  XF86AudioLowerVolume = "0x1008ff11";
  XF86AudioMuteVolume = "0x1008ff12";
  XF86AudioRaiseVolume = "0x1008ff13";
  volumeIncrement = 0.05;
in
{
  programs.dwm = {
    tagKeys.definitions = [ ];
    enable = true;
    modifier = "Mod4Mask";
    snap = 16;
    borderpx = 3;

    terminal = {
      launchKey = "XK_space";
      modifier = "${modifer}";
      appCmd = "st";
    };
    font = {
      size = 12;
      name = "JetbrainsMono NF";
    };
    appLauncher = {
      launchKey = "XK_Tab";
      appArgs = [
        {
          flag = "-c";
        }
        {
          flag = "-m";
          argument = ''dmenumon'';
        }
        {
          flag = "-p";
          argument = ''"run:"'';
        }
        {
          flag = "-fn";
          argument = ''"${cfg.font.name}:size=14"'';
        }
      ];
    };

    patches = {
      cool-autostart = {
        enable = true;
        autostart = [
          {
            cmd = "st";
            args = null;
          }
          {
            cmd = "xrandr --output 'HDMI-1' -o right --rotate left";
            args = null;
          }
          {
            cmd = "dwm-script";
            args = null;
          }
        ];
      };
      gaps = {
        enable = false;
        width = 8;
      };
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

    key = {
      useDefault = true;
      keys = [
        {
          modifier = 0;
          key = XF86AudioRaiseVolume;
          function = "spawn";
          argument = ''SHCMD("wpctl set-volume @DEFAULT_AUDIO_SINK@ ${toString volumeIncrement}+")'';
        }
        {
          modifier = 0;
          key = XF86AudioLowerVolume;
          function = "spawn";
          argument = ''SHCMD("wpctl set-volume @DEFAULT_AUDIO_SINK@ ${toString volumeIncrement}-")'';
        }
        {
          modifier = 0;
          key = XF86AudioMuteVolume;
          function = "spawn";
          argument = ''SHCMD("wpctl mute @DEFAULT_AUDIO_SINK@ toggle")'';
        }
      ];
    };
  };
}

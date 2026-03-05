{
  lib,
  config,
  colorscheme,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
in
{

  options.software-config.st.enable = mkEnableOption "my st config";
  config = mkIf config.software-config.st.enable {
    programs.st = {
      enable = true;
      borderpx = 3;
      shell = "/bin/sh";
      tab-spaces = 2;
      cursor-thickness = 2;
      cursor-shape = 2;
      color-name = {
        normal = [
          "#${colorscheme.base08}"
          "#${colorscheme.base0B}"
          "#${colorscheme.base0D}"
          "#${colorscheme.base0A}"
          "#${colorscheme.base0E}"
          "#${colorscheme.base0C}"
          "#${colorscheme.base07}"
          "#${colorscheme.base01}"
        ];
        bright = [
          "#${colorscheme.base08}"
          "#${colorscheme.base0B}"
          "#${colorscheme.base0D}"
          "#${colorscheme.base0A}"
          "#${colorscheme.base0E}"
          "#${colorscheme.base0C}"
          "#${colorscheme.base07}"
          "#${colorscheme.base01}"
        ];
        extra = [
          "#cccccc"
          "#555555"
        ];
        foreground = "#${colorscheme.base07}";
        background = "#${colorscheme.base00}";
      };
      latency = {
        min = 1;
        max = 10;
      };
      font = {
        name = "JetbrainsMono NF";
        size = 20;
        autohint = true;
        antialias = true;
      };
    };
  };
}

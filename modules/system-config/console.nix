{
  lib,
  config,
  pkgs,
  colorscheme,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
in
{
  options.system-config.console.enable = mkEnableOption "my console config";
  config = mkIf config.system-config.console.enable {
    console = {
      keyMap = "us";
      earlySetup = true;
      font = "ter-16x";
      packages = [ pkgs.terminus_font ];

      colors = [
        colorscheme.base00
        colorscheme.base01
        colorscheme.base02
        colorscheme.base03
        colorscheme.base04
        colorscheme.base05
        colorscheme.base06
        colorscheme.base07
        colorscheme.base08
        colorscheme.base09
        colorscheme.base0A
        colorscheme.base0B
        colorscheme.base0C
        colorscheme.base0D
        colorscheme.base0E
        colorscheme.base0F
      ];
    };
  };
}

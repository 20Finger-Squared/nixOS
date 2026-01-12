{
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
in
{
  options.system-config.font.enable = mkEnableOption "my font config";
  config = mkIf config.system-config.font.enable {
    fonts = {
      packages = [
        pkgs.noto-fonts-color-emoji
        pkgs.nerd-fonts.jetbrains-mono
      ];

      fontconfig.defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}

{
  lib,
  config,
  my-pkgs,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
in
{
  options.system-config.x11-screenshoting.enable = mkEnableOption "my config for taking screenshots in x11";
  config = mkIf config.system-config.x11-screenshoting.enable {
    environment.systemPackages = [
      my-pkgs.sxot
      my-pkgs.selx
      pkgs.ffmpeg
    ];
  };
}

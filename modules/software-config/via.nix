{
  pkgs,
  config,
  lib,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.software-config.via.enable = mkEnableOption "my via configuration";
  config = mkIf config.software-config.via.enable {
    environment.systemPackages = [
      pkgs.vial
      pkgs.via
      pkgs.qmk
    ];
    hardware.keyboard.qmk.enable = true;
    services.udev.packages = [ pkgs.via ];
  };
}

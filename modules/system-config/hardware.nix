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
  options.system-config.hardware.enable = mkEnableOption "my hardware config";
  config = mkIf config.system-config.hardware.enable {
    hardware = {
      bluetooth.enable = true;
      graphics = {
        enable = true;
        extraPackages = with pkgs; [ mesa ];
      };
    };
  };
}

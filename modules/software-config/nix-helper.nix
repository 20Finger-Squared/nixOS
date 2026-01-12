{ lib, config, ... }:
let
  inherit (lib) mkIf mkEnableOption;
in
{
  options.software-config.nh.enable = mkEnableOption "my nh config";
  config = mkIf config.software-config.nh.enable {
    programs.nh = {
      enable = true;
      flake = "/home/tf/nixOS/";
    };
  };
}

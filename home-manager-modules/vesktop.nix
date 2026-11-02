{ lib, config, ... }:
{
  options.home-manager-config.vesktop = lib.mkEnableOption "My home-manager vesktop config";
  config = lib.mkIf config.home-manager-config.vesktop {
    programs.vesktop.enable = true;
  };
}

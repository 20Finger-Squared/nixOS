{ lib, config, ... }:
{
  options.home-manager-config.hyprpolkitagent = lib.mkEnableOption "My home-manger hyprpolkitagent config";
  config = lib.mkIf config.home-manager-config.hyprpolkitagent {
    services.hyprpolkitagent = {
      enable = true;
    };
  };
}

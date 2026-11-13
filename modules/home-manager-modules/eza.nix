{ config, lib, ... }:
{
  options.home-manager-config.eza = lib.mkEnableOption "My home-manager eza config";
  config = lib.mkIf config.home-manager-config.eza {
    programs.eza = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

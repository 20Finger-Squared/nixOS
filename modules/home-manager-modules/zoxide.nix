{ lib, config, ... }:
{
  options.home-manager-config.zoxide = lib.mkEnableOption "My hoem-manager zoxide config";
  config = lib.mkIf config.home-manager-config.zoxide {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

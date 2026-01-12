{ lib, config, ... }:
let
  inherit (lib) mkIf mkEnableOption;
in
{
  options.system-config.powerManagement.enable = mkEnableOption "my power management config";
  options.system-config.documentation.enable = mkEnableOption "my documentation config";
  config = mkIf config.system-config.documentation.enable {
    documentation.dev.enable = true;
    powerManagement.cpuFreqGovernor = mkIf config.powerManagement.enable "schedutil";
  };
}

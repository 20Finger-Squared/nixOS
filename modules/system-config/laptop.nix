{ lib, config, ... }:
let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.laptop = {
    enable = mkEnableOption "my laptop settings";
    powerSaving.enable = mkEnableOption "my laptop-power settings";

  };
  config = mkIf config.options.laptop.enable {
    services = {
      logind.settings.Login = {
        HandleLidSwitch = "lock";
        HandleLidSwitchExternalPower = "lock";
        HandleLidSwitchDocked = "ignore";
      };

      tlp.enable = mkIf config.options.laptop.powerSaving.enable true;
    };
    powerManagement.enable = mkIf config.options.laptop.powerSaving.enable true;
  };
}

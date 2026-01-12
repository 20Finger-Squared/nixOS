{ lib, config, ... }:
let
  inherit (lib)
    mkIf
    mkEnableOption
    mkOption
    types
    ;
in
{
  options.system-config.networking.enable = mkEnableOption "my networking config";
  options.system-config.networking.hostname = mkOption {
    type = types.str;
  };
  config = mkIf config.system-config.networking.enable {
    networking.hostName = config.system-config.networking.hostname; # Define your hostname.
    networking.networkmanager.enable = true;
  };
}

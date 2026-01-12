{ config, lib, ... }:
let
  inherit (lib) mkIf mkEnableOption;
in
{
  options.software-config.steam.enable = mkEnableOption "my steam config";
  config = mkIf config.software-config.steam.enable {
    programs = {
      dconf.enable = true;
      steam = {
        enable = true;
        gamescopeSession.enable = true; # optional, but recommended
      };
    };
  };
}

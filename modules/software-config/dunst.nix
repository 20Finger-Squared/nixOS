{
  lib,
  config,
  my-pkgs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.software-config.dunst.enable = mkEnableOption "my dusnt config";
  config = mkIf config.software-config.dunst.enable {
    environment.systemPackages = [
      my-pkgs.dunst
    ];
  };
}

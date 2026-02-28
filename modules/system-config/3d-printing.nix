{
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.system-config.pkg-3D-printing.enable = mkEnableOption "config for 3D printing software";
  config = mkIf config.system-config.pkg-3D-printing.enable {
    environment.systemPackages = [
      pkgs.orca-slicer
    ];
  };
}

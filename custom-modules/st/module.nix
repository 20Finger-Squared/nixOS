{ lib, ... }:
with lib;
let
  cfg = options.programs.st;
in
{
  options.programs.st = {
    enable = mkEnableOption "st";
  };
  config = mkIf cfg.enable { };
}

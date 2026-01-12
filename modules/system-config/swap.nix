{ lib, config, ... }:
let
  inherit (lib) mkIf mkEnableOption;
in
{
  options.system-config.zram.enable = mkEnableOption "my zramSwap config";
  config = mkIf config.system-config.zram.enable {
    zramSwap = {
      enable = true;
      memoryPercent = 25;
      algorithm = "zstd";
      priority = 10;
    };
  };
}

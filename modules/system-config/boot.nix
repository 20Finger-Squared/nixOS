{ lib, config, ... }:
let
  inherit (lib) mkIf mkEnableOption;
in
{
  options.system-config.boot.enable = mkEnableOption "my boot config";
  config = mkIf config.system-config.boot.enable {
    boot = {
      kernel.sysctl."vm.swappiness" = 10;
      kernel.sysctl."kernel.unprivileged_bpf_disabled" = 1;
      kernel.sysctl."net.core.bpf_jit_harden" = 2;
      initrd.systemd.enable = true;
      kernelModules = [
        "uinput"
      ];
      kernelParams = [
        "quiet"
        "splash"
      ];
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        timeout = 1;
      };

      tmp = {
        useTmpfs = true;
        tmpfsSize = "10%";
      };
    };
  };
}

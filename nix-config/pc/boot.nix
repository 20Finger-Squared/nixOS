{ ... }:
{
  kernel.sysctl."vm.swappiness" = 180;
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
}

{ mkConfig, ... }@inputs:
mkConfig.software "tailscale" inputs {
  services.tailscale.enable = true;
  networking.firewall.trustedInterfaces = [ "tailscale0" ];
}

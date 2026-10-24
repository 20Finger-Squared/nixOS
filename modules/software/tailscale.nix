{ mkConfig, ... }@inputs:
mkConfig.mkSoftwareOption "tailscale" inputs {
  services.tailscale.enable = true;
  networking.firewall.trustedInterfaces = [ "tailscale0" ];
}

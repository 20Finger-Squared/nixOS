{ mkConfig, ... }@inputs:
mkConfig.system "printing" inputs {
  services.printing.enable = true;
}

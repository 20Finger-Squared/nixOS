{ mkConfig, ... }@inputs:
mkConfig.mkSystemOption "printing" inputs {
  services.printing.enable = true;
}

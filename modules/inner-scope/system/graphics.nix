{ mkConfig, ... }@inputs:
mkConfig.system "graphics" inputs {
  hardware.graphics.enable = true;
}

{ mkConfig, ... }@inputs:
mkConfig.mkSystemOption "graphics" inputs {
  hardware.graphics.enable = true;
}

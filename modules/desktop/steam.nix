{ mkConfig, ... }@inputs:
mkConfig.desktop "steam" inputs {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  programs.steam.enable = true;
}

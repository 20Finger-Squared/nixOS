{ lib, ... }@inputs:
lib.mkDesktopOption "plasma" inputs {
  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
}

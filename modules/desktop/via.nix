{ lib, pkgs, ... }@inputs:
lib.mkDesktopOption "via" inputs {
  environment.systemPackages = [
    pkgs.vial
    pkgs.via
    pkgs.qmk
  ];
  hardware.keyboard.qmk.enable = true;
  services.udev.packages = [ pkgs.via ];
}

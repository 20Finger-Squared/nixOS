{ lib, pkgs, ... }@inputs:
lib.mkDesktopOption "steam" inputs {
  hardware.graphics = { 
    enable = true;
    enable32Bit = true;
    };
  environment.systemPackages = [
    pkgs.steam
  ];
}

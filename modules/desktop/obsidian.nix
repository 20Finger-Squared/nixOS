{ lib, pkgs, ... }@inputs:
lib.mkDesktopOption "obsidian" inputs {
  environment.systemPackages = [
    pkgs.obsidian
  ];
}

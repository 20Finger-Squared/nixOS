{lib, pkgs, ...}@inputs:
lib.mkSystemOption "graphics" inputs {
  hardware.graphics.enable = true;
}

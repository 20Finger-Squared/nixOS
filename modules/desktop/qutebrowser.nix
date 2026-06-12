{ lib, my-pkgs, ... }@inputs:
lib.mkDesktopOption "qutebrowser" inputs {
  environment.systemPackages = [
    my-pkgs.qutebrowser
  ];
}

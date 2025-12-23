{ pkgs, ... }:
{
  imports = [
    ./keyboard.nix
    ./misc.nix
    ./security.nix
    ./xdg-portal.nix
    ./x11.nix
  ];
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="input", TAG+="uaccess", TAG+="udev-acl"
  '';
  services.udev.packages = [
    pkgs.vial
    pkgs.via
  ];
}

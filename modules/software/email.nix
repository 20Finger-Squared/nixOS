{ lib, pkgs, ...}@inputs:
lib.mkSoftwareOption "email" inputs {
  environment.systemPackages = [pkgs.thunderbird];
  }

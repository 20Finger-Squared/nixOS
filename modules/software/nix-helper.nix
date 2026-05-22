{ lib, ... }@inputs:
lib.mkSoftwareOption "nh" inputs {
  programs.nh = {
    enable = true;
    flake = "/home/tf/nixOS/";
  };
}

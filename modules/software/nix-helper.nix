{ lib, ... }@inputs:
lib.mkSoftwareOption "nh" inputs {
  programs.nh = {
    enable = true;
    flake = "/home/tf/nixOS/";
    clean = {
      enable = true;
      extraArgs = "--keep 10 --keep-since 7d";
    };
  };
}

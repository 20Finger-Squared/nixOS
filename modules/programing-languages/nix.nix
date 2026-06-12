{ lib, pkgs, ... }@inputs:
lib.mkProgramingLanguageOption "nix" inputs {
  environment.systemPackages = [
    # dev setup for nixOS
    pkgs.nixfmt # formatter for dot-nix
    pkgs.nixd
  ];
}

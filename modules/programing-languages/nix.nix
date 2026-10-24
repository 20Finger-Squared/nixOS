{ mkConfig, pkgs, ... }@inputs:
mkConfig.programing-language "nix" inputs {
  environment.systemPackages = [
    # dev setup for nixOS
    pkgs.nixfmt # formatter for dot-nix
    pkgs.nixd
  ];
}

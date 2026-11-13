{ mkConfig, pkgs, ... }@inputs:
mkConfig.desktop "obsidian" inputs {
  environment.systemPackages = [
    pkgs.obsidian
  ];
}

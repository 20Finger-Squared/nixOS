{ mkConfig, pkgs, ... }@inputs:
mkConfig.mkDesktopOption "obsidian" inputs {
  environment.systemPackages = [
    pkgs.obsidian
  ];
}

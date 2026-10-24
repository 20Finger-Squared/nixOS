{ mkConfig, pkgs, ... }@inputs:
mkConfig.programing-language "python" inputs {
  environment.systemPackages = [
    pkgs.ruff
    pkgs.basedpyright
  ];
}

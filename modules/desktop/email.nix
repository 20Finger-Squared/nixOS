{ mkConfig, pkgs, ... }@inputs:
mkConfig.software "email" inputs {
  environment.systemPackages = [ pkgs.thunderbird ];
}

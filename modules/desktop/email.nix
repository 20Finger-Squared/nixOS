{ mkConfig, pkgs, ... }@inputs:
mkConfig.mkSoftwareOption "email" inputs {
  environment.systemPackages = [ pkgs.thunderbird ];
}

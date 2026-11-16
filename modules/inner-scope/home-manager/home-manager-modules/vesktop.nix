{ mkConfig, ... }@module-args:
mkConfig.home.software "vesktop" module-args {
  programs.vesktop.enable = true;
}

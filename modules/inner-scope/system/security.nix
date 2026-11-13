{ mkConfig, ... }@inputs:
mkConfig.system "security" inputs {
  security.rtkit.enable = true;
}

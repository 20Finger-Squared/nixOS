{ mkConfig, ... }@inputs:
mkConfig.mkSystemOption "security" inputs {
  security.rtkit.enable = true;
}

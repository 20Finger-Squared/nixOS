{ mkConfig, ... }@inputs:
mkConfig.mkSystemOption "keyboard" inputs {
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}

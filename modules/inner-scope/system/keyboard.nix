{ mkConfig, ... }@inputs:
mkConfig.system "keyboard" inputs {
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}

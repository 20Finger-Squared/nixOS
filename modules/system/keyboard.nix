{ lib, ... }@inputs:
lib.mkSystemOption "keyboard" inputs {
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}

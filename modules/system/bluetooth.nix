{ lib, pkgs, ... }@inputs:
lib.mkSystemOption "bluetooth" inputs {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings.General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
    };
  };
  services.blueman.enable = true;

}

{ lib, pkgs, ... }@inputs:
lib.mkSystemOption "asha" inputs {
  boot.extraModprobeConfig = ''
    options bluetooth enable_ecred=1
  '';

  hardware.bluetooth = {
    enable = true;
    settings.LE = {
      MinConnectionInterval = 16;
      MaxConnectionInterval = 16;
      ConnectionLatency = 10;
      ConnectionSupervisionTimeout = 100;
    };
  };

  environment.systemPackages = [ pkgs.asha-pipewire-sink ];
}

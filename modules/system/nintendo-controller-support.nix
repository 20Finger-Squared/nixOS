{
  lib,
  pkgs,
  ...
}@inputs:
lib.mkSystemOption "nintendo-controller-support" inputs {
  hardware = {
    steam-hardware.enable = true;
    uinput.enable = true;
  };

  programs.gamemode.enable = true;

  boot.kernelModules = [ "hid_nintendo" ];

  users.users.tf.extraGroups = [
    "input"
    "uinput"
  ];

  services = {
    joycond.enable = true;

    udev = {
      extraRules = ''
        KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0666"
      '';

      # Add udev rules for user-grade controller access
      packages = [
        pkgs.game-devices-udev-rules
      ];
    };
  };
}

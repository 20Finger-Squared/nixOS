{ lib, pkgs, ... }:
{
  services = {
    libinput.enable = true;
    xserver = {
      autoRepeatDelay = 200;
      autoRepeatInterval = 32;
      enable = true;
      xkb.layout = "us";
      displayManager.startx = {
        enable = true;
        generateScript = true;
        extraCommands = import ./dot-xinitrc.nix {
          inherit lib;
          inherit pkgs;
        };
      };
    };
  };
}

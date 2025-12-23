{ pkgs, ... }:
{
  services = {
    libinput.enable = true;
    xserver = {
      autoRepeatDelay = 200;
      autoRepeatInterval = 32;
      enable = true;
      xkb.layout = "us";
    };
  };
}

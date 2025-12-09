{ ... }:
{
  services = {
    libinput.enable = true;
    picom.enable = true;
    xserver = {
      autoRepeatDelay = 200;
      autoRepeatInterval = 32;
      enable = true;
      xkb.layout = "gb";
    };
  };
}

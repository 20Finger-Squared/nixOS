{ ... }:
{
  services = {
    # Enable Bluetooth
    xserver = {
      enable = true;
      xkb.layout = "gb";
    };
  };
}

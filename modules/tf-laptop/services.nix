{ pkgs, ... }:
{
  pulseaudio.enable = false;
  printing.enable = true;
  fstrim.enable = true;
  openssh.settings.PermitRootLogin = "no";
  # Enable Bluetooth
  blueman.enable = true;
  xserver = {
    enable = true;
    xkb.layout = "gb";
  };
  kanata = {
    enable = true;
    keyboards.main = {
      # this defines the actual Katana (Kanata) config
      config = ''
        (defsrc caps)
        (deflayer base
          esc
        )
      '';
    };
  };

  displayManager = {
    enable = true;
    ly = {
      enable = true; # Ly a simple login screen
      package = pkgs.ly;
      settings = {
        allow_empty_password = false;
        animation = "doom";
        auth_fails = 1;
        box_title = "Best place to login";
        clear_password = true;
        clock = "%x";
      };
    };
  };

  # Enable sound with pipewire.
  pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}

{ pkgs, ... }:
{
# Security and services

  services.kanata = {
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


# Ly a simple login screen
  services.displayManager.ly.enable = true;

# Enable CUPS to print documents.
  services.printing.enable = true;

# Enable Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

# Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}

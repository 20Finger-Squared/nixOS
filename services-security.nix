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
  services.displayManager = {
    enable = true;
    sessionPackages =
    [
    (pkgs.writeTextFile {
            name = "dwl";
            destination = "/share/wayland-sessions/dwl.desktop";
            text = builtins.readFile ./dwl/dwl.desktop;
            passthru.providedSessions = [ "dwl" ];
        })
    ];
  };


# Make sure sway lock can work
  security.pam.services.swaylock = {};

# Enable CUPS to print documents.
  services.printing.enable = true;

# Enable Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

# Btrfs
  services.btrfs.autoScrub = {
          enable = true;
          interval = "weekly";
      };

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

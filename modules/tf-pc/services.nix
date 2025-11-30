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

    sessionPackages = [
      (pkgs.writeTextFile {
        name = "dwl";
        destination = "/share/wayland-sessions/dwl.desktop";
        text = ''
          [Desktop Entry]
          Name=dwl
          Comment=dwm for Wayland
          Exec=dwl
          Type=Application
        '';
        passthru.providedSessions = [ "dwl" ];
      })
    ];
  };

  # Btrfs
  btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
  };

  # Enable sound with pipewire.
  pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}

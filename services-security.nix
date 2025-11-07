{ pkgs, ... }:
{
# Security and services



      openssh.settings.PermitRootLogin = "no";
  };

  hardware = {
      opengl = {
          enable = true;
          extraPackages = with pkgs; [ mesa.drivers ];
      };
  };

  services = {
      pulseaudio.enable = false;
      rtkit.enable = true;
      printing.enable = true;
      fstrim.enable = true;
# Enable Bluetooth
      blueman.enable = true;
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

# Make sure sway lock can work
  security.pam.services.swaylock = {};

        sessionPackages =
        [
        (pkgs.writeTextFile {
                name = "dwl";
                destination = "/share/wayland-sessions/dwl.desktop";
                text = builtins.readFile ./dwl-wm/dwl/dwl.desktop;
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
  };
}

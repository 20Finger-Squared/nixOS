{ config, lib, pkgs, ... }:

{
    imports = [ ./hardware-configuration.nix ];

# zram
    zramSwap = {
      enable = true;
      algorithm = "zstd";
      memoryPercent = 50;  # 32GB compressed swap
      priority = 10;
    };

# Keep more in memory
    boot.kernel.sysctl = {
      "vm.swappiness" = 1;           # Almost never swap
      "vm.vfs_cache_pressure" = 10;  # Keep filesystem cache longer
      "vm.dirty_ratio" = 40;         # More dirty pages in RAM
      "vm.dirty_background_ratio" = 20;
    };

# Boot configuration
    boot = {
        plymouth.enable = true;

        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };

        kernelPackages = pkgs.linuxPackages_latest;
    };

# System configuration
    time.timeZone = "Europe/London";

# Networking - WiFi configuration
    networking = {
        hostName = "rhyliePC";
        networkmanager.enable = true;
        wireless.enable = false; # Disable wpa_supplicant (conflicts with NetworkManager)
    };

# Bluetooth
    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
    };

# Localization
    i18n.defaultLocale = "en_GB.UTF-8";
    console.keyMap = "uk";

# Audio
    security.rtkit.enable = true;

# Services
    services = {
        keyd = {
            keyboards.default = {
                settings.main.capslock = "esc";
                ids = ["*"];
            enable = true;
            };
        };

        printing.enable = true;
        gnome.gnome-keyring.enable = true;
        blueman.enable = true;
        pipewire = {
            enable = true;
            pulse.enable = true;
            alsa = {
                enable = true;
                support32Bit = true;
            };
        };
    };

# Programs
    programs = {
        sway = {
            enable = true;
            wrapperFeatures.gtk = true;
        };
        zsh.enable = true;
        firefox.enable = true;
        wshowkeys.enable = true;
    };

# User configuration
    users = {
        users.rhylie = {
            isNormalUser = true;
            description = "Rhylie";
            useDefaultShell = true;
            extraGroups = [ "wheel" "networkmanager" ];
        };

        defaultUserShell = pkgs.zsh;
    };

# Stylix theming
    stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
        image = ./rubiks-cube.png;
        cursor = {
            package = pkgs.rose-pine-cursor;
            size = 24;
            name = "BreezeX-RosePine-Linux";
        };
        fonts = {
            monospace = {
                package = pkgs.jetbrains-mono;
                name = "JetBrains Mono";
            };
            sansSerif = {
                package = pkgs.inter;
                name = "Inter";
            };
            serif = {
                package = pkgs.ibm-plex;
                name = "IBM Plex Serif";
            };
            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };
        };
    };

# Nix configuration
    nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
        cores = 0;
    };

# System packages
    environment.systemPackages = with pkgs; [
        neovim
            mako
            discord
            wl-clipboard
            vim
            bluez
            networkmanager
            wget
            zoxide
            networkmanagerapplet
            wshowkeys
            eza
            fastfetch
            fzf
            aseprite
            btop
            ripgrep
            waybar
            clang
            clang-tools
            python314
            nil
            socat
            ];

# Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    documentation = {
      enable = true;
      man.enable = true;
      nixos.enable = true;
    };

# System state version
    system.stateVersion = "25.05"; # Check what version you should use
}

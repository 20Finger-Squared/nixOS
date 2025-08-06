{ config, lib, pkgs, ... }:
{
    imports = [ ./hardware-configuration.nix ];

# Boot configuration.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;

# System configuration.
    time.timeZone = "Europe/London";

# Networking - WiFi configuration.
    networking.hostName = "rhyliePC"; # Define your hostname.
    networking.networkmanager.enable = true;
    networking.wireless.enable = false; # Disable wpa_supplicant (conflicts with NetworkManager).

# Bluetooth.
    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
    };
    services.blueman.enable = true;

# Localization.
    i18n.defaultLocale = "en_GB.UTF-8";
    console.keyMap = "uk";

# Audio.
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

# Services.
    services.printing.enable = true;
    services.gnome.gnome-keyring.enable = true;

# Programs.
    programs.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
    };

    programs.zsh.enable = true;
    programs.firefox.enable = true;
    programs.wshowkeys.enable = true;

# User configuration.
    users.users.rhylie = {
        isNormalUser = true;
        description = "Rhylie";
        shell = pkgs.zsh;
        extraGroups = [ "wheel" "networkmanager" ]; # networkmanager group is important for WiFi.
    };

    stylix.enable = true;
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    stylix.image = ./rubiks-cube.png;


# Nix configuration.
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

# System packages.
    environment.systemPackages = with pkgs; [
                tmux
                git
                grim
                slurp
                neovim
                zsh
                mako
                discord
                wl-clipboard
                vim
                bluez
                networkmanager
                sway
                wget
                rofi
                zoxide
                kitty
                networkmanagerapplet
                wshowkeys
                gruvbox-dark-gtk
                gruvbox-dark-icons-gtk
                eza
                fastfetch
                fzf
                aseprite
                btop
            ];

# Allow unfree packages.
    nixpkgs.config.allowUnfree = true;

# Don't forget to set the system state version.
    system.stateVersion = "25.05"; # Check what version you should use.
}

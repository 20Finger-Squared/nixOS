{ config, pkgs, ... }:

{
    imports =
        [
            ./hardware-configuration.nix
            ./environment.nix
            ./services-security.nix
        ];


# Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.tmp.useTmpfs = true;
    boot.tmp.tmpfsSize = "25%";

# networking and bluetooth
    networking.hostName = "tf-nixos"; # Define your hostname.
        networking.networkmanager.enable = true;


    time.timeZone = "Europe/London";

    i18n.defaultLocale = "en_GB.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_GB.UTF-8";
        LC_IDENTIFICATION = "en_GB.UTF-8";
        LC_MEASUREMENT = "en_GB.UTF-8";
        LC_MONETARY = "en_GB.UTF-8";
        LC_NAME = "en_GB.UTF-8";
        LC_NUMERIC = "en_GB.UTF-8";
        LC_PAPER = "en_GB.UTF-8";
        LC_TELEPHONE = "en_GB.UTF-8";
        LC_TIME = "en_GB.UTF-8";
    };

# Configure console keymap
    console.keyMap = "uk";

# Configure installed fonts
    fonts = {
        packages = [
            pkgs.noto-fonts-emoji
                pkgs.nerd-fonts.jetbrains-mono
        ];

        fontconfig.defaultFonts = {
            monospace = [ "JetBrainsMono Nerd Font" ];
            emoji = [ "Noto Color Emoji" ];
        };
    };


    users.users.tf = {
        isNormalUser = true;
        description = "Rhylie M. Orton";
        extraGroups = [ "networkmanager" "wheel" "render" "seat" "input" "video"];
        packages = [
            pkgs.lazygit
            pkgs.ripgrep
            pkgs.kitty
        ];
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = [ # tiny unopinonated packages or those of which are not relevant to one particular user
        pkgs.tmux
        pkgs.wl-clipboard
        pkgs.ly
        pkgs.nil
    ];

    system.stateVersion = "25.05"; # Did you read the comment?
}

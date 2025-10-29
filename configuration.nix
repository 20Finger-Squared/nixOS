# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
      ./environment.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "tf-nixos"; # Define your hostname.

# Enable networking
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

# Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
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

  home-manager.users.tf = import ./home.nix;


  users.users.tf = {
    isNormalUser = true;
    description = "Rhylie M. Orton";
    extraGroups = [ "networkmanager" "wheel" "render" "seat" "input" "video"];
    packages = [
      pkgs.lazygit
        pkgs.nil
        pkgs.ripgrep
        pkgs.kitty
    ];
  };

# Install firefox.
  programs.firefox.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };

# Allow unfree packages
  nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search, run:
# $ nix search wget
  environment.systemPackages = [
    pkgs.tmux
    pkgs.wl-clipboard
    pkgs.ly
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}

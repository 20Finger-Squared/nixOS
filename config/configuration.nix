{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./user.nix
    ./stylix.nix
  ];

  # zram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50; # 32GB compressed swap
    priority = 10;
  };

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia.open = false; # unless you want the open kernel module
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

  # Keep more in memory
  boot.kernel.sysctl = {
    "vm.swappiness" = 1; # Almost never swap
    "vm.vfs_cache_pressure" = 10; # Keep filesystem cache longer
    "vm.dirty_ratio" = 40; # More dirty pages in RAM
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

  # Audio and security
  security = {
    rtkit.enable = true; # Enables RealtimeKit for audio apps to get realtime priorities
    sudo.extraConfig = ''
      Defaults insults
    '';
  };

  # Services
  services = {
    keyd = {
      keyboards.default = {
        settings.main.capslock = "esc";
        ids = [ "*" ];
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

  # Nix configuration
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    cores = 0;
  };

  # System packages
  environment.systemPackages = [
    # system utils
    pkgs.wl-clipboard
    pkgs.bluez
    pkgs.networkmanager

    # cli tools
    pkgs.networkmanagerapplet
    pkgs.wget
    pkgs.ripgrep
    pkgs.socat
    pkgs.starship
    pkgs.nh

    # apps
    # gui
    pkgs.deluge
    pkgs.steam

    # tui
    pkgs.neovim
    pkgs.fzf

    # wm specific stuff
    pkgs.rofi
    pkgs.mako
    pkgs.grim

    # lsps
    pkgs.lua-language-server # lua
    pkgs.nil # nix

    # formaters
    pkgs.stylua # lua
    pkgs.nixfmt-rfc-style # nix

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

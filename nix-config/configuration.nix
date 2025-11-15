{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./services-security.nix
    ./suckless/package.nix
  ];

  powerManagement.cpuFreqGovernor = "schedutil";
  powerManagement.powertop.enable = true;
  environment = import ./boot.nix { };

  zramSwap = import ./swap.nix { };
  console = import ./console.nix { };
  fonts = import ./fonts.nix { inherit pkgs; };
  i18n = import ./locale.nix { inherit lib; };
  boot = import ./boot.nix { };

  # networking and bluetooth
  networking.hostName = "tf-nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  users.users.tf = {
    isNormalUser = true;
    description = "Rhylie M. Orton";
    extraGroups = [
      "networkmanager"
      "wheel"
      "render"
      "seat"
      "input"
      "video"
    ];
    packages = [
      pkgs.lazygit
      pkgs.discord
      pkgs.kitty
      pkgs.eza
      pkgs.steam
      pkgs.krita
    ];
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      keep-outputs = true;
      keep-derivations = true;
      max-jobs = "auto";
      cores = 0;
      warn-dirty = false;

      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
  };

  documentation.dev.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.dconf.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true; # optional, but recommended
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}

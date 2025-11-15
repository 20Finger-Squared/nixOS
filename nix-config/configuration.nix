{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./services-security.nix
    ./suckless/package.nix
  ];

  powerManagement.cpuFreqGovernor = "schedutil";
  powerManagement.powertop.enable = true;

  environment = import ./environment.nix { inherit pkgs; };
  zramSwap = import ./swap.nix { };
  console = import ./console.nix { };
  fonts = import ./fonts.nix { inherit pkgs; };
  users = import ./users.nix { inherit pkgs; };
  i18n = import ./locale.nix { inherit lib; };
  boot = import ./boot.nix { };
  nix = import ./nix-settings.nix { };
  xdg = import ./xdg-portal.nix { inherit pkgs; };

  # networking and bluetooth
  networking.hostName = "tf-nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  documentation.dev.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.dconf.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true; # optional, but recommended
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}

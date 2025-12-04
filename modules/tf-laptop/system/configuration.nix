{
  nixpkgs-24-11,
  pkgs,
  lib,
  ...
}:

{
  powerManagement.cpuFreqGovernor = "schedutil";

  # networking and bluetooth
  networking.hostName = "tf-laptop"; # Define your hostname.
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

{ ... }:
{
  powerManagement.cpuFreqGovernor = "schedutil";

  programs = {
    dconf.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true; # optional, but recommended
    };
  };

  # networking and bluetooth
  networking.hostName = "tf-pc"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  documentation.dev.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05"; # Did you read the comment?
}

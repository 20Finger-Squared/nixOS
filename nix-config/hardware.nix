{ pkgs, ... }:
{
  bluetooth.enable = true;
  opentabletdriver.enable = true;
  opentabletdriver.daemon.enable = true;
  graphics = {
    enable = true;
    extraPackages = with pkgs; [ mesa ];
  };
  rtkit.enable = true; # Enables RealtimeKit for audio apps to get realtime priorities
  sudo.extraConfig = ''
    Defaults insults
  '';
}

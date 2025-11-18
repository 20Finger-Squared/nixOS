{ pkgs, ... }:
{
  bluetooth.enable = true;
  opentabletdriver.enable = true;
  opentabletdriver.daemon.enable = true;
  graphics = {
    enable = true;
    extraPackages = with pkgs; [ mesa ];
  };
}

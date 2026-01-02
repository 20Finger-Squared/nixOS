{ lib, pkgs, ... }:
let
  dwm-statusbar = pkgs.writeShellScriptBin "dwm-status" ''
    #!/usr/bin/env bash
    while true;
    do
        xsetroot -name " $(date '+%X | %A | %d %B') "
        sleep 1
    done
  '';
  dot-xinitrc = /* sh */ ''
    #!/usr/bin/env bash
    # xrandr --output HDMI-1 --rotate left
    #
    # # script to update dwm-statusbar
    # ${dwm-statusbar} &
    #
    #
    # # makes the clipboard append to a file for a dmenu script
    # while true; do
    #   clipnotify && echo "$(xclip -selection clipboard -o)" >> ~/.clipboard_history
    # done &
    #
    # Start dwm
    exec ${lib.getExe pkgs.dwm}
  '';
in
{
  services = {
    libinput.enable = true;
    xserver = {
      autoRepeatDelay = 200;
      autoRepeatInterval = 32;
      enable = true;
      xkb.layout = "us";
      windowManager.dwm.enable = true;
      displayManager.startx = {
        enable = true;
        generateScript = true;
        extraCommands = dot-xinitrc;
      };
    };
  };
}

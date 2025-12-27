{ pkgs, lib }:
/* sh */ ''
    #!/bin/sh
    xrandr --output HDMI-1 --rotate left

  # script to update dwm-statusbar
    ${pkgs.writeShellScript "dwm-status" import ./dwm-statusbar.nix} &

    # makes the clipboard append to a file for a dmenu script
    while true; do
      clipnotify && echo "$(xclip -selection clipboard -o)" >> ~/.clipboard_history
    done &

    # Start dwm
    exec ${lib.getExe pkgs.dwm}
''

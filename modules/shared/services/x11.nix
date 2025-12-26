{ pkgs, ... }:
{
  services = {
    libinput.enable = true;
    xserver = {
      autoRepeatDelay = 200;
      autoRepeatInterval = 32;
      enable = true;
      xkb.layout = "us";
      displayManager.startx = {
        enable = true;
        generateScript = true;
        extraCommands = /* sh */ ''
          #!/bin/sh
          xrandr --output HDMI-1 --rotate left

          # makes the clipboard append to a file for a dmenu script
          while true; do
            clipnotify && echo "$(xclip -selection clipboard -o)" >> ~/.clipboard_history
          done &

          # Start dwm
          exec dwm
        '';
      };
    };
  };
}

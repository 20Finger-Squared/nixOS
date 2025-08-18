{ pkgs, lib, config, ... }:

{
    wayland.windowManager.sway = {
        enable = true;
        checkConfig = true;
        extraConfig = ''
            exec kitty
            exec firefox
        '';
        config = {
            input."*" = {
                xkb_layout   = "gb";
                xkb_options  = "caps:escape";
                repeat_delay = "250";
                repeat_rate  = "5";
            };

            bars = [];

            modifier = "Mod4";
            keybindings = let
            sMod  =    "${modifier}+SHIFT";
            modifier = config.wayland.windowManager.sway.config.modifier;
            left  =    config.wayland.windowManager.sway.config.left;
            down  =    config.wayland.windowManager.sway.config.down;
            up    =    config.wayland.windowManager.sway.config.up;
            right =    config.wayland.windowManager.sway.config.right;
            in {
                "${modifier}+t" = "exec ${pkgs.kitty}/bin/kitty";
                "${sMod}+t" = "exec ${pkgs.firefox}/bin/firefox";

                "${modifier}+q" = "kill";
                "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun";

                "${modifier}+${left}" = "focus left";
                "${modifier}+${down}" = "focus down";
                "${modifier}+${up}" = "focus up";
                "${modifier}+${right}" = "focus right";

                "${sMod}+${left}" = "move left";
                "${sMod}+${down}" = "move down";
                "${sMod}+${up}" = "move up";
                "${sMod}+${right}" = "move right";

                "${modifier}+b" = "splith";
                "${modifier}+v" = "splitv";
                "${sMod}+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";

# Switch the current container between different layout styles
                "${modifier}+s" = "layout stacking";
                "${modifier}+w" = "layout tabbed";
                "${modifier}+e" = "layout toggle split";

# Make the current focus fullscreen
                "${modifier}+f" = "fullscreen";

                "${modifier}+Shift+minus" = "move scratchpad";
                "${modifier}+minus" = "scratchpad show";

# Switch to workspace
                "${modifier}+1" = "workspace number 1";
                "${modifier}+2" = "workspace number 2";
                "${modifier}+3" = "workspace number 3";
                "${modifier}+4" = "workspace number 4";
                "${modifier}+5" = "workspace number 5";
                "${modifier}+6" = "workspace number 6";
                "${modifier}+7" = "workspace number 7";
                "${modifier}+8" = "workspace number 8";
                "${modifier}+9" = "workspace number 9";
                "${modifier}+0" = "workspace number 10";
# "Move" focused container to workspace
                "${sMod}+1" = "move container to workspace number 1";
                "${sMod}+2" = "move container to workspace number 2";
                "${sMod}+3" = "move container to workspace number 3";
                "${sMod}+4" = "move container to workspace number 4";
                "${sMod}+5" = "move container to workspace number 5";
                "${sMod}+6" = "move container to workspace number 6";
                "${sMod}+7" = "move container to workspace number 7";
                "${sMod}+8" = "move container to workspace number 8";
                "${sMod}+9" = "move container to workspace number 9";
                "${sMod}+0" = "move container to workspace number 10";

# Special keys to adjust volume via PulseAudio
                "--locked XF86AudioMute" = "exec pactl set-sink-mute \@DEFAULT_SINK@ toggle";
                "--locked XF86AudioLowerVolume" = "exec pactl set-sink-volume \@DEFAULT_SINK@ -5%";
                "--locked XF86AudioRaiseVolume" = "exec pactl set-sink-volume \@DEFAULT_SINK@ +5%";
                "--locked XF86AudioMicMute" = "exec pactl set-source-mute \@DEFAULT_SOURCE@ toggle";
# Special keys to adjust brightness via brightnessctl
                "--locked XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
                "--locked XF86MonBrightnessUp" = "exec brightnessctl set 5%+";

# Special key to take a screenshot with grim
                "Print" = "exec grim";

            };
        };
    };
}

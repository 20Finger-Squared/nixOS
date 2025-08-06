{ pkgs, lib, config, nix-colors, ... }:

{
    wayland.windowManager.sway = {
        enable = true;
        checkConfig = true;
        config = {
            modifier = "Mod4";
            input = {
                "*" = {
                    xkb_layout = "gb";
                    xkb_options = "caps:escape";
                    repeat_delay = "250";
                    repeat_rate = "5";
                };
            };
            keybindings =
            let
                modifier = config.wayland.windowManager.sway.config.modifier;
                sMod  =    "${modifier}+SHIFT";
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
            };
        };};}

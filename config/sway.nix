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
                left = "h";
                down = "j";
                up = "k";
                right = "l";
            in {
                "${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty";
                "${modifier}+Shift+q" = "kill";
                "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun";

                "${modifier}+${left}" = "focus left";
                "${modifier}+${down}" = "focus down";
                "${modifier}+${up}" = "focus up";
                "${modifier}+${right}" = "focus right";
                "${modifier}+${left}" = "focus left";
                "${modifier}+${down}" = "focus down";
                "${modifier}+${up}" = "focus up";
                "${modifier}+${right}" = "focus right";

            };
        };
    };
}

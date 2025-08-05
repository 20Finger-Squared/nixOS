{ config, nix-colors, ... }:

{
# Git configuration.
    wayland.windowManager.sway = {
        enable = true;
        checkConfig = true;

# Bar config.
        config.bars.*.colors = {
# The button for the active workspace.
            activeWorkspace = {
                Border = "#${config.colorScheme.palette.base01}";
                background = "#${config.colorScheme.palette.base02}";
                text = "#${config.colorScheme.palette.base07}";
            };

# Same as inactive
            focusedWorkspace = {
                Border = "#${config.colorScheme.palette.base02}";
                background = "#${config.colorScheme.palette.base03}";
                text = "#${config.colorScheme.palette.base06}";
            };
            inactiveWorkspace = {
                Border = "#${config.colorScheme.palette.base01}";
                background = "#${config.colorScheme.palette.base02}";
                text = "#${config.colorScheme.palette.base07}";
            };

            bindingMode = {
                background = "#${config.colorScheme.palette.base08}";
                border = "#${config.colorScheme.palette.base08}";
                text = "#${config.colorScheme.palette.base07}";
            };
            background = "#${config.colorScheme.palette.base00}";

        };
    };
}


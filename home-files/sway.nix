{ config, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = true;
    wrapperFeatures.gtk = true;
    config = {
      input = {
        "type:keyboard" = {
          xkb_layout = "gb";
          xkb_options = "caps:escape"; # Optional: remap CapsLock to Escape
        };
      };

      colors = let
        background_0 = "#282828";
        background_0_strong = "#928374";
        foreground_0 = "#A89984";
        foreground_0_strong = "#EBDBB2";
        red_muted     = "#CC241D";
        red_strong    = "#FB4934";
        green_muted   = "#98971A";
        green_strong  = "#B8BB26";
        yellow_muted  = "#D79921";
        yellow_strong = "#FABD2F";
        blue_muted    = "#458588";
        blue_strong   = "#83A598";
        purple_muted  = "#B16286";
        purple_strong = "#D3869B";
        aqua_muted    = "#689D6A";
        aqua_strong   = "#8EC07C";
        orange_muted  = "#D65D0E";
        orange_strong = "#FE8019";

        bgfg_0_hard_bg = "#1D2021";
        bgfg_0_hard_fg = "#FBF1C7";
        bgfg_0_soft_bg = "#32302F";
        bgfg_0_soft_fg = "#FBF1C7";
        bgfg_1_bg = "#3C3836";
        bgfg_1_fg = "#EBDBB2";
        bgfg_2_bg = "#504945";
        bgfg_2_fg = "#D5C4A1";
        bgfg_3_bg = "#665C54";
        bgfg_3_fg = "#BDAE93";
        bgfg_4_bg = "#7C6F64";
        bgfg_4_fg = "#A89984";
      in {
        focused = {
          background = "${yellow_strong}";
          border = "${yellow_muted}";
          childBorder = "${yellow_muted}";
          indicator = "${blue_strong}";
          text = "${bgfg_0_hard_bg}";
        };

        unfocused = {
          background = "${bgfg_1_bg}";
          border = "${bgfg_4_fg}";
          childBorder = "${bgfg_2_bg}";
          indicator = "${blue_muted}";
          text = "${foreground_0}";
        };

        urgent = {
          background = "${red_muted}";
          border = "${red_strong}";
          childBorder = "${bgfg_2_bg}";
          indicator = "${orange_strong}";
          text = "${bgfg_0_hard_fg}";
        };

        background = "${bgfg_1_bg}";
      };

      gaps = {
        horizontal = 3;
        outer = 2;
        smartBorders = "on";
        smartGaps = true;
      };

      fonts = {
        names = ["JetbrainsMono NF"];
        size = 9.0;
      };

      floating = {
        border = 3;
        titlebar = true;
      };

      focus = {
        followMouse = true;
        wrapping = "workspace";
        mouseWarping = true;
        newWindow = "none";
      };

      keybindings = let
        # === Base modifiers ===
        mod = config.wayland.windowManager.sway.config.modifier;
        altMod = "${mod}+Shift";

        # === Applications ===
        terminal = config.wayland.windowManager.sway.config.terminal;
        webBrowser = "firefox";
        launcher = config.wayland.windowManager.sway.config.menu;
        fileManager = "thunar";

        # === Directions ===
        left  = "h";
        down  = "j";
        up    = "k";
        right = "l";

        # === Utilities ===
        volumeMute = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
        volumeDown = "pactl set-sink-volume @DEFAULT_SINK@ -5%";
        volumeUp   = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
        brightnessDown = "brightnessctl set 5%-";
        brightnessUp   = "brightnessctl set 5%+";
        screenshot = "grim";
      in {
        # --- Applications ---
        "${mod}+t" = "exec ${terminal}";
        "${altMod}+t" = "exec ${webBrowser}";
        "${mod}+d" = "exec ${launcher}";
        "${mod}+e" = "exec ${fileManager}";
        "Print" = "exec ${screenshot}";

        # --- System ---
        "${mod}+q" = "kill";
        "${altMod}+c" = "reload";
        "${altMod}+e" = "exec swaynag -t warning -m 'Exit Sway?' -B 'Exit' 'swaymsg exit'";
        "${altMod}+p" = "exec poweroff";
        "${altMod}+Return" = "exec swaylock -f -c 000000";

        # --- Focus movement ---
        "${mod}+${left}"  = "focus left";
        "${mod}+${down}"  = "focus down";
        "${mod}+${up}"    = "focus up";
        "${mod}+${right}" = "focus right";

        # --- Move windows ---
        "${altMod}+${left}"  = "move left";
        "${altMod}+${down}"  = "move down";
        "${altMod}+${up}"    = "move up";
        "${altMod}+${right}" = "move right";

        # --- Workspaces ---
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        "${altMod}+1" = "move container to workspace number 1";
        "${altMod}+2" = "move container to workspace number 2";
        "${altMod}+3" = "move container to workspace number 3";
        "${altMod}+4" = "move container to workspace number 4";
        "${altMod}+5" = "move container to workspace number 5";
        "${altMod}+6" = "move container to workspace number 6";
        "${altMod}+7" = "move container to workspace number 7";
        "${altMod}+8" = "move container to workspace number 8";
        "${altMod}+9" = "move container to workspace number 9";
        "${altMod}+0" = "move container to workspace number 10";

        # --- Layout controls ---
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+y" = "layout toggle split";
        "${mod}+f" = "fullscreen toggle";
        "${mod}+a" = "focus parent";
        "${altMod}+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";

        # --- Scratchpad ---
        "${altMod}+minus" = "move scratchpad";
        "${mod}+minus" = "scratchpad show";

        # --- Resize mode ---
        "${mod}+r" = "mode resize";

        # --- Media / brightness ---
        "XF86AudioMute" = "exec ${volumeMute}";
        "XF86AudioLowerVolume" = "exec ${volumeDown}";
        "XF86AudioRaiseVolume" = "exec ${volumeUp}";
        "XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "XF86MonBrightnessDown" = "exec ${brightnessDown}";
        "XF86MonBrightnessUp" = "exec ${brightnessUp}";

        # --- Screenshots ---
        "${mod}+Print" = "exec ${screenshot} ~/Pictures/screenshot-$(date +'%Y-%m-%d-%H%M%S').png";
      };

      window = {
        border = 3;
        hideEdgeBorders = "smart";
      };

      defaultWorkspace = "1";

      # Default apps
      menu = "fuzzel";
      terminal = "${pkgs.kitty}/bin/kitty";

      # Modifiers & navigation
      modifier = "Mod4";
      right = "h";
      left  = "l";
      up    = "k";
      down  = "j";
    };
  };
}

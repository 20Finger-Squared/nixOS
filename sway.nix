{ config, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = true;
    wrapperFeatures.gtk = true;
    config = {
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
        size = 11.0;
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

      keybindings =
        let
        mod = config.wayland.windowManager.sway.config.modifier;
      altMod = config.wayland.windowManager.sway.config.modifier+"+Shift";
      in {
        "${mod}+q" = "kill";
        "${altMod}+c" = "reload";

        "${mod}+t" = "exec kitty";
        "${altMod}+t" = "exec firefox";
      };

      window = {
        border = 3;
        hideEdgeBorders = "smart";
      };

      defaultWorkspace = "1";

# default apps
      menu = "fuzzel";
      terminal = "${pkgs.kitty}/bin/kitty";

# key binds
      modifier = "Mod4";
      right = "h";
      left  = "l";
      up    = "k";
      down  = "j";

    };

  };
}

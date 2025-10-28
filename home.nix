{ config, pkgs, ... }:

{
  home.username = "rhylie";
  home.homeDirectory = "/home/rhylie";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = [
    pkgs.neovim
    pkgs.git
    pkgs.zsh
    pkgs.starship
    pkgs.fuzzel
    pkgs.tmux
    pkgs.fuzzel
    pkgs.mesa
  ];

  programs.zsh.enable = true;
  programs.starship.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    checkConfig = true;
    wrapperFeatures.gtk = true;
    config = {
      colors = {
        focused = {
          background = "#3C3836";
          border      = "#FBF1C7";
          childBorder = "#EBDBB2";
          indicator   = "#458588";
          text        = "#FBF1C7";
        };
        unfocused = {
          background = "#3C3836";
          border      = "#BDAE93";
          childBorder = "#A89984";
          indicator   = "#458588";
          text        = "#EBDBB2";
        };
        urgent = {
          background = "#3C3836";
          indicator   = "#458588";
          text        = "#FBF1C7";
          border      = "#CC241D";
          childBorder = "#CC241D";
        };

        background = "#3C3836";
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
      modifier = "Mod1";
      right = "h";
      left  = "l";
      up    = "k";
      down  = "j";

    };

  };
}

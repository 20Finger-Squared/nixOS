{ config, pkgs, ... }:
{
  home.stateVersion = "25.05";
  home.username = "rhylie";
  home.homeDirectory = "/home/rhylie";
  
  imports = [
    ./neovim/default.nix
  ];

  # Font configuration
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  programs.home-manager.enable = true;

  # Git configuration
  programs.git = {
    enable = true;
    userName = "20Finger-Squared";
    userEmail = "orhylie@gmail.com";
  };

  # Kitty terminal with Gruvbox theme and JetBrains Mono NF
  programs.kitty = {
    enable = true;
    settings = {
      # Gruvbox colors
      background = "#282828";
      foreground = "#ebdbb2";
      
      # Normal colors
      color0 = "#282828";   # black
      color1 = "#cc241d";   # red
      color2 = "#98971a";   # green
      color3 = "#d79921";   # yellow
      color4 = "#458588";   # blue
      color5 = "#b16286";   # magenta
      color6 = "#689d6a";   # cyan
      color7 = "#a89984";   # white
      
      # Bright colors
      color8 = "#928374";   # bright black
      color9 = "#fb4934";   # bright red
      color10 = "#b8bb26";  # bright green
      color11 = "#fabd2f";  # bright yellow
      color12 = "#83a598";  # bright blue
      color13 = "#d3869b";  # bright magenta
      color14 = "#8ec07c";  # bright cyan
      color15 = "#ebdbb2";  # bright white
      
      # Font configuration
      font_family = "JetBrainsMono Nerd Font";
      bold_font = "JetBrainsMono Nerd Font Bold";
      italic_font = "JetBrainsMono Nerd Font Italic";
      bold_italic_font = "JetBrainsMono Nerd Font Bold Italic";
      font_size = 14;
      
      # Window padding
      window_padding_width = 10;
    };
  };

  # Zsh configuration
  programs.zsh = {
    enable = true;
    shellAliases = {
      wkeys = "wshowkeys -b '#282828' -f '#ebdbb2' -s '#458588' -t 1 -a bottom";
      ll = "ls -la";
      la = "ls -la";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixOS/.#rhyliePC";
    };
  };
}

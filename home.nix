{ config, pkgs, ... }:

{
  home.stateVersion = "24.11";
  
  # Git configuration
  programs.git = {
    enable = true;
    userName = "Rhylie";
    userEmail = "your-email@example.com"; # Change this
  };
  
  # Alacritty terminal with Gruvbox theme
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "#282828";
          foreground = "#ebdbb2";
        };
        normal = {
          black = "#282828";
          red = "#cc241d";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          magenta = "#b16286";
          cyan = "#689d6a";
          white = "#a89984";
        };
        bright = {
          black = "#928374";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#ebdbb2";
        };
      };
      font.size = 12;
      window.padding = { x = 10; y = 10; };
    };
  };
  
  # Zsh configuration
  programs.zsh = {
    enable = true;
    shellAliases = {
      wkeys = "wshowkeys -b '#282828' -f '#ebdbb2' -s '#458588' -t 1000 -a bottom";
      ll = "ls -la";
      la = "ls -la";
      rebuild = "sudo nixos-rebuild switch";
    };
    initExtra = ''
      # Add any additional zsh configuration here
    '';
  };
  
  # Additional programs you might want to configure
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}

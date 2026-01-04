{ config, ... }:
let
  colorscheme = config.colorscheme;
in
{
  programs.st = {
    enable = true;
    borderpx = 3;
    shell = "/bin/sh";
    tabSpaces = 2;
    cursorThickness = 2;
    cursorShape = 2;
    color = {
      colors = {
        normal = {
          red = "#${colorscheme.base08}";
          green = "#${colorscheme.base0B}";
          blue = "#${colorscheme.base0D}";
          yellow = "#${colorscheme.base0A}";
          magenta = "#${colorscheme.base0E}";
          cyan = "#${colorscheme.base0C}";
          white = "#${colorscheme.base07}";
          black = "#${colorscheme.base00}";
        };
        bright = {
          red = "#${colorscheme.base08}";
          green = "#${colorscheme.base0B}";
          blue = "#${colorscheme.base0D}";
          yellow = "#${colorscheme.base0A}";
          magenta = "#${colorscheme.base0E}";
          cyan = "#${colorscheme.base0C}";
          white = "#${colorscheme.base07}";
          black = "#${colorscheme.base00}";
        };
      };
      fg = "#${colorscheme.base07}";
      bg = "#${colorscheme.base00}";
    };
    latency = {
      min = 1;
      max = 10;
    };
    allowaltscreen = true;
    characterBox = {
      width = 1.0;
      height = 1.0;
    };
    clickTimeouts = {
      triple = 300;
      double = 150;
    };
    font = {
      name = "JetbrainsMono NF";
      size = 16;
      autohint = false;
      antialias = true;
    };
  };
}

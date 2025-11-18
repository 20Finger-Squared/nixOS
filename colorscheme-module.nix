{ lib, ... }:
with lib;
{
  options.gruvbox = {
    rgb = mkOption {
      type = types.attrs;
      description = "RGB color definitions";
      default = {
        bg = mkOption {
          type = types.attrs;
          description = "Background color definitions";
          default = {
            hard = mkOption {
              type = types.str;
              description = "Background 0 (Hard)";
              default = "rgb(29,32,33)";
            };
            soft = mkOption {
              type = types.str;
              description = "Background 0 (Soft)";
              default = "rgb(50,48,47)";
            };
            "0" = mkOption {
              type = types.str;
              description = "Background 0";
              default = "rgb(40,40,40)";
            };
            "1" = mkOption {
              type = types.str;
              description = "Background 1";
              default = "rgb(60,56,54)";
            };
            "2" = mkOption {
              type = types.str;
              description = "Background 2";
              default = "rgb(80,73,69)";
            };
            "3" = mkOption {
              type = types.str;
              description = "Background 3";
              default = "rgb(102,92,84)";
            };
            "4" = mkOption {
              type = types.str;
              description = "Background 4";
              default = "rgb(124,111,100)";
            };
          };
        };

        fg = mkOption {
          type = types.attrs;
          description = "Foreground color definitions";
          default = {
            hard = mkOption {
              type = types.str;
              description = "Foreground 0 (Hard)";
              default = "rgb(251,241,199)";
            };
            soft = mkOption {
              type = types.str;
              description = "Foreground 0 (Soft)";
              default = "rgb(251,241,199)";
            };
            "0" = mkOption {
              type = types.str;
              description = "Foreground 0";
              default = "rgb(168,153,132)";
            };
            "1" = mkOption {
              type = types.str;
              description = "Foreground 1";
              default = "rgb(235,219,178)";
            };
            "2" = mkOption {
              type = types.str;
              description = "Foreground 2";
              default = "rgb(213,196,161)";
            };
            "3" = mkOption {
              type = types.str;
              description = "Foreground 3";
              default = "rgb(189,174,147)";
            };
            "4" = mkOption {
              type = types.str;
              description = "Foreground 4";
              default = "rgb(168,153,132)";
            };
          };
        };

        strong = mkOption {
          type = types.attrs;
          description = "Strong color definitions";
          default = {
            red = mkOption {
              type = types.str;
              description = "Strong Red";
              default = "rgb(251,73,52)";
            };
            green = mkOption {
              type = types.str;
              description = "Strong Green";
              default = "rgb(184,187,38)";
            };
            yellow = mkOption {
              type = types.str;
              description = "Strong Yellow";
              default = "rgb(250,189,47)";
            };
            blue = mkOption {
              type = types.str;
              description = "Strong Blue";
              default = "rgb(131,165,152)";
            };
            purple = mkOption {
              type = types.str;
              description = "Strong Purple";
              default = "rgb(211,134,155)";
            };
            aqua = mkOption {
              type = types.str;
              description = "Strong Aqua";
              default = "rgb(142,192,124)";
            };
            orange = mkOption {
              type = types.str;
              description = "Strong Orange";
              default = "rgb(254,128,25)";
            };
            gray = mkOption {
              type = types.str;
              description = "Strong Gray";
              default = "rgb(146,131,116)";
            };
          };
        };

        muted = mkOption {
          type = types.attrs;
          description = "Muted color definitions";
          default = {
            red = mkOption {
              type = types.str;
              description = "Muted Red";
              default = "rgb(204,36,29)";
            };
            green = mkOption {
              type = types.str;
              description = "Muted Green";
              default = "rgb(152,151,26)";
            };
            yellow = mkOption {
              type = types.str;
              description = "Muted Yellow";
              default = "rgb(215,153,33)";
            };
            blue = mkOption {
              type = types.str;
              description = "Muted Blue";
              default = "rgb(69,133,136)";
            };
            purple = mkOption {
              type = types.str;
              description = "Muted Purple";
              default = "rgb(177,98,134)";
            };
            aqua = mkOption {
              type = types.str;
              description = "Muted Aqua";
              default = "rgb(104,157,106)";
            };
            orange = mkOption {
              type = types.str;
              description = "Muted Orange";
              default = "rgb(214,93,14)";
            };
            gray = mkOption {
              type = types.str;
              description = "Muted Gray";
              default = "rgb(146,131,116)";
            };
          };
        };
      };
    };

    rgba = mkOption {
      type = types.attrs;
      description = "RGBA color definitions";
      default = {
        bg = mkOption {
          type = types.attrs;
          description = "Background color definitions";
          default = {
            hard = mkOption {
              type = types.str;
              description = "Background 0 (Hard)";
              default = "rgba(29,32,33,1)";
            };
            soft = mkOption {
              type = types.str;
              description = "Background 0 (Soft)";
              default = "rgba(50,48,47,1)";
            };
            "0" = mkOption {
              type = types.str;
              description = "Background 0";
              default = "rgba(40,40,40,1)";
            };
            "1" = mkOption {
              type = types.str;
              description = "Background 1";
              default = "rgba(60,56,54,1)";
            };
            "2" = mkOption {
              type = types.str;
              description = "Background 2";
              default = "rgba(80,73,69,1)";
            };
            "3" = mkOption {
              type = types.str;
              description = "Background 3";
              default = "rgba(102,92,84,1)";
            };
            "4" = mkOption {
              type = types.str;
              description = "Background 4";
              default = "rgba(124,111,100,1)";
            };
          };
        };

        fg = mkOption {
          type = types.attrs;
          description = "Foreground color definitions";
          default = {
            hard = mkOption {
              type = types.str;
              description = "Foreground 0 (Hard)";
              default = "rgba(251,241,199,1)";
            };
            soft = mkOption {
              type = types.str;
              description = "Foreground 0 (Soft)";
              default = "rgba(251,241,199,1)";
            };
            "0" = mkOption {
              type = types.str;
              description = "Foreground 0";
              default = "rgba(168,153,132,1)";
            };
            "1" = mkOption {
              type = types.str;
              description = "Foreground 1";
              default = "rgba(235,219,178,1)";
            };
            "2" = mkOption {
              type = types.str;
              description = "Foreground 2";
              default = "rgba(213,196,161,1)";
            };
            "3" = mkOption {
              type = types.str;
              description = "Foreground 3";
              default = "rgba(189,174,147,1)";
            };
            "4" = mkOption {
              type = types.str;
              description = "Foreground 4";
              default = "rgba(168,153,132,1)";
            };
          };
        };

        strong = mkOption {
          type = types.attrs;
          description = "Strong color definitions";
          default = {
            red = mkOption {
              type = types.str;
              description = "Strong Red";
              default = "rgba(251,73,52,1)";
            };
            green = mkOption {
              type = types.str;
              description = "Strong Green";
              default = "rgba(184,187,38,1)";
            };
            yellow = mkOption {
              type = types.str;
              description = "Strong Yellow";
              default = "rgba(250,189,47,1)";
            };
            blue = mkOption {
              type = types.str;
              description = "Strong Blue";
              default = "rgba(131,165,152,1)";
            };
            purple = mkOption {
              type = types.str;
              description = "Strong Purple";
              default = "rgba(211,134,155,1)";
            };
            aqua = mkOption {
              type = types.str;
              description = "Strong Aqua";
              default = "rgba(142,192,124,1)";
            };
            orange = mkOption {
              type = types.str;
              description = "Strong Orange";
              default = "rgba(254,128,25,1)";
            };
            gray = mkOption {
              type = types.str;
              description = "Strong Gray";
              default = "rgba(146,131,116,1)";
            };
          };
        };

        muted = mkOption {
          type = types.attrs;
          description = "Muted color definitions";
          default = {
            red = mkOption {
              type = types.str;
              description = "Muted Red";
              default = "rgba(204,36,29,1)";
            };
            green = mkOption {
              type = types.str;
              description = "Muted Green";
              default = "rgba(152,151,26,1)";
            };
            yellow = mkOption {
              type = types.str;
              description = "Muted Yellow";
              default = "rgba(215,153,33,1)";
            };
            blue = mkOption {
              type = types.str;
              description = "Muted Blue";
              default = "rgba(69,133,136,1)";
            };
            purple = mkOption {
              type = types.str;
              description = "Muted Purple";
              default = "rgba(177,98,134,1)";
            };
            aqua = mkOption {
              type = types.str;
              description = "Muted Aqua";
              default = "rgba(104,157,106,1)";
            };
            orange = mkOption {
              type = types.str;
              description = "Muted Orange";
              default = "rgba(214,93,14,1)";
            };
            gray = mkOption {
              type = types.str;
              description = "Muted Gray";
              default = "rgba(146,131,116,1)";
            };
          };
        };
      };
    };

    hsl = mkOption {
      type = types.attrs;
      description = "HSL color definitions";
      default = {
        bg = mkOption {
          type = types.attrs;
          description = "Background color definitions";
          default = {
            hard = mkOption {
              type = types.str;
              description = "Background 0 (Hard)";
              default = "hsl(195,6.5%,12.2%)";
            };
            soft = mkOption {
              type = types.str;
              description = "Background 0 (Soft)";
              default = "hsl(20,3.1%,19%)";
            };
            "0" = mkOption {
              type = types.str;
              description = "Background 0";
              default = "hsl(0,0%,16%)";
            };
            "1" = mkOption {
              type = types.str;
              description = "Background 1";
              default = "hsl(20,5.3%,22.4%)";
            };
            "2" = mkOption {
              type = types.str;
              description = "Background 2";
              default = "hsl(22,7.4%,29.2%)";
            };
            "3" = mkOption {
              type = types.str;
              description = "Background 3";
              default = "hsl(27,9.7%,36.5%)";
            };
            "4" = mkOption {
              type = types.str;
              description = "Background 4";
              default = "hsl(28,10.7%,43.9%)";
            };
          };
        };

        fg = mkOption {
          type = types.attrs;
          description = "Foreground color definitions";
          default = {
            hard = mkOption {
              type = types.str;
              description = "Foreground 0 (Hard)";
              default = "hsl(48,86.7%,88.2%)";
            };
            soft = mkOption {
              type = types.str;
              description = "Foreground 0 (Soft)";
              default = "hsl(48,86.7%,88.2%)";
            };
            "0" = mkOption {
              type = types.str;
              description = "Foreground 0";
              default = "hsl(35,17.1%,58.8%)";
            };
            "1" = mkOption {
              type = types.str;
              description = "Foreground 1";
              default = "hsl(43,58.8%,81%)";
            };
            "2" = mkOption {
              type = types.str;
              description = "Foreground 2";
              default = "hsl(40,38.2%,73.3%)";
            };
            "3" = mkOption {
              type = types.str;
              description = "Foreground 3";
              default = "hsl(39,24.1%,65.9%)";
            };
            "4" = mkOption {
              type = types.str;
              description = "Foreground 4";
              default = "hsl(35,17.1%,58.8%)";
            };
          };
        };

        strong = mkOption {
          type = types.attrs;
          description = "Strong color definitions";
          default = {
            red = mkOption {
              type = types.str;
              description = "Strong Red";
              default = "hsl(6,96%,59%)";
            };
            green = mkOption {
              type = types.str;
              description = "Strong Green";
              default = "hsl(61,66%,44%)";
            };
            yellow = mkOption {
              type = types.str;
              description = "Strong Yellow";
              default = "hsl(42,95.3%,58.2%)";
            };
            blue = mkOption {
              type = types.str;
              description = "Strong Blue";
              default = "hsl(157,15.9%,58%)";
            };
            purple = mkOption {
              type = types.str;
              description = "Strong Purple";
              default = "hsl(344,46.7%,67.6%)";
            };
            aqua = mkOption {
              type = types.str;
              description = "Strong Aqua";
              default = "hsl(104,35.1%,62%)";
            };
            orange = mkOption {
              type = types.str;
              description = "Strong Orange";
              default = "hsl(27,99.1%,54.7%)";
            };
            gray = mkOption {
              type = types.str;
              description = "Strong Gray";
              default = "hsl(30,12%,51%)";
            };
          };
        };

        muted = mkOption {
          type = types.attrs;
          description = "Muted color definitions";
          default = {
            red = mkOption {
              type = types.str;
              description = "Muted Red";
              default = "hsl(2,75%,46%)";
            };
            green = mkOption {
              type = types.str;
              description = "Muted Green";
              default = "hsl(60,71%,35%)";
            };
            yellow = mkOption {
              type = types.str;
              description = "Muted Yellow";
              default = "hsl(40,73.4%,48.6%)";
            };
            blue = mkOption {
              type = types.str;
              description = "Muted Blue";
              default = "hsl(183,32.7%,40.2%)";
            };
            purple = mkOption {
              type = types.str;
              description = "Muted Purple";
              default = "hsl(333,33.6%,53.9%)";
            };
            aqua = mkOption {
              type = types.str;
              description = "Muted Aqua";
              default = "hsl(122,21.3%,51.2%)";
            };
            orange = mkOption {
              type = types.str;
              description = "Muted Orange";
              default = "hsl(24,87.7%,44.7%)";
            };
            gray = mkOption {
              type = types.str;
              description = "Muted Gray";
              default = "hsl(30,12%,51%)";
            };
          };
        };
      };
    };

    hex = mkOption {
      type = types.attrs;
      description = "Hexadecimal color definitions";
      default = {
        bg = mkOption {
          type = types.attrs;
          description = "Background color definitions";
          default = {
            hard = mkOption {
              type = types.str;
              description = "Background 0 (Hard)";
              default = "#1D2021";
            };
            soft = mkOption {
              type = types.str;
              description = "Background 0 (Soft)";
              default = "#32302F";
            };
            "0" = mkOption {
              type = types.str;
              description = "Background 0";
              default = "#282828";
            };
            "1" = mkOption {
              type = types.str;
              description = "Background 1";
              default = "#3C3836";
            };
            "2" = mkOption {
              type = types.str;
              description = "Background 2";
              default = "#504945";
            };
            "3" = mkOption {
              type = types.str;
              description = "Background 3";
              default = "#665C54";
            };
            "4" = mkOption {
              type = types.str;
              description = "Background 4";
              default = "#7C6F64";
            };
          };
        };

        fg = mkOption {
          type = types.attrs;
          description = "Foreground color definitions";
          default = {
            hard = mkOption {
              type = types.str;
              description = "Foreground 0 (Hard)";
              default = "#FBF1C7";
            };
            soft = mkOption {
              type = types.str;
              description = "Foreground 0 (Soft)";
              default = "#FBF1C7";
            };
            "0" = mkOption {
              type = types.str;
              description = "Foreground 0";
              default = "#A89984";
            };
            "1" = mkOption {
              type = types.str;
              description = "Foreground 1";
              default = "#EBDBB2";
            };
            "2" = mkOption {
              type = types.str;
              description = "Foreground 2";
              default = "#D5C4A1";
            };
            "3" = mkOption {
              type = types.str;
              description = "Foreground 3";
              default = "#BDAE93";
            };
            "4" = mkOption {
              type = types.str;
              description = "Foreground 4";
              default = "#A89984";
            };
          };
        };

        strong = mkOption {
          type = types.attrs;
          description = "Strong color definitions";
          default = {
            red = mkOption {
              type = types.str;
              description = "Strong Red";
              default = "#FB4934";
            };
            green = mkOption {
              type = types.str;
              description = "Strong Green";
              default = "#B8BB26";
            };
            yellow = mkOption {
              type = types.str;
              description = "Strong Yellow";
              default = "#FABD2F";
            };
            blue = mkOption {
              type = types.str;
              description = "Strong Blue";
              default = "#83A598";
            };
            purple = mkOption {
              type = types.str;
              description = "Strong Purple";
              default = "#D3869B";
            };
            aqua = mkOption {
              type = types.str;
              description = "Strong Aqua";
              default = "#8EC07C";
            };
            orange = mkOption {
              type = types.str;
              description = "Strong Orange";
              default = "#FE8019";
            };
            gray = mkOption {
              type = types.str;
              description = "Strong Gray";
              default = "#928374";
            };
          };
        };

        muted = mkOption {
          type = types.attrs;
          description = "Muted color definitions";
          default = {
            red = mkOption {
              type = types.str;
              description = "Muted Red";
              default = "#CC241D";
            };
            green = mkOption {
              type = types.str;
              description = "Muted Green";
              default = "#98971A";
            };
            yellow = mkOption {
              type = types.str;
              description = "Muted Yellow";
              default = "#D79921";
            };
            blue = mkOption {
              type = types.str;
              description = "Muted Blue";
              default = "#458588";
            };
            purple = mkOption {
              type = types.str;
              description = "Muted Purple";
              default = "#B16286";
            };
            aqua = mkOption {
              type = types.str;
              description = "Muted Aqua";
              default = "#689D6A";
            };
            orange = mkOption {
              type = types.str;
              description = "Muted Orange";
              default = "#D65D0E";
            };
            gray = mkOption {
              type = types.str;
              description = "Muted Gray";
              default = "#928374";
            };
          };
        };
      };
    };
  };
}

{ mkConfig, colourscheme, lib, pkgs, ... }@module-args:
let
  scheme = colourscheme.noHashtag;
  addOpacity = hex_colour: opacity: "${hex_colour}${opacity}";
  wrapColour = hex_colour: addOpacity hex_colour "FF";
in 
mkConfig.home.software "fuzzel" module-args {
  programs.fuzzel = {
    enable = true;
    settings = {

      main = {
        tabs = 2;
        font = "Jetbrains Mono NF:weight=bold:size=15";
        terminal = "${lib.getExe pkgs.kitty}";
        layer = "overlay";

        lines = 16;
      };

      colors = {
        background = wrapColour scheme.bg;
        text = wrapColour scheme.light-gray;

        message = wrapColour scheme.red;

        input = wrapColour scheme.yellow;
        match = wrapColour scheme.gray;

        placeholder = wrapColour scheme.darkest-gray;

        selection = wrapColour scheme.dark-gray;
        selection-text = wrapColour scheme.fg;
        selection-match = wrapColour scheme.yellow;

        border = wrapColour scheme.dark-gray;
      };

      border = {
        width = 5;
        radius = 5;
      };
    };
  };
}

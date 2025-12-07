{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  file = pkgs.writeText "config.h" (
    import ./file.nix {
      inherit lib;
      inherit config;
    }
  );

  package = pkgs.st.overrideAttrs (oldAttrs: {
    postPatch = "cp ${file} config.def.h";
  });
in
{
  options.programs.st = {
    enable = mkEnableOption "st";
    borderpx = mkOption {
      type = types.int;
      default = 2;
      example = 0;
      description = "The width of borders in pixels";
    };

    shell = mkOption {
      type = types.str;
      default = "${pkgs.bash}/bin/sh";
      example = "${pkgs.tmux}/bin/sh";
      description = "The cmd initially executed on start-up";
    };

    allowaltscreen = mkOption {
      type = types.bool;
      default = true;
      example = false;
      description = ''
        Enables things like vim to create a screen over your terminal
        best to be turned on unless you prefer how the tty by default does it.'';
    };

    cursorThickness = mkOption {
      type = types.int;
      default = 2;
      example = 3;
      description = "thickness of underline and bar cursors";
    };

    bellvolume = mkOption {
      type = types.ints.between (-100) 100;
      default = 0;
      example = 100;
      description = "bell volume. It must be a value between -100 and 100. Use 0 for disabling it";
    };

    tabSpaces = mkOption {
      type = types.int;
      default = 8;
      example = 2;
      description = "To how many spaces tabs are expanded to";
    };

    terminalName = mkOption {
      type = types.str;
      default = "st-256color";
      example = "terminal-256color";
      description = "The default window name for st";
    };

    blinking = mkOption {
      type = types.int;
      default = 800;
      example = 0;
      description = "blinking timeout (set to 0 to disable blinking) for the terminal blinking attribute.";
    };

    latency = {
      min = mkOption {
        type = types.int;
        default = 2;
        example = 3;
        description = "minimum latency for screen to be drawn";
      };
      max = mkOption {
        type = types.int;
        default = 33;
        example = 14;
        description = "maximum latency for screen to be drawn";
      };
    };

    allowwindowops = mkEnableOption ''escape sequences. This is off by default for security.'';

    characterBox = {
      height = mkOption {
        type = types.float;
        default = 1.0;
        example = 5.0;
        description = "The character bounding box multiplier for the charcter's height";
      };
      width = mkOption {
        type = types.float;
        default = 1.0;
        example = 5.0;
        description = "The character bounding box multiplier for the charcter's width";
      };
    };

    clickTimeouts = {
      double = mkOption {
        type = types.int;
        default = 300;
        example = 150;
        description = "The selection timeouts for double clicking";
      };
      triple = mkOption {
        type = types.int;
        default = 600;
        example = 300;
        description = "The selection timeouts for triple clicking";
      };
    };

    font = {
      name = mkOption {
        type = types.str;
        default = "Liberation Mono";
        example = "monospace";
        description = "The name of the font";
      };
      size = mkOption {
        type = types.int;
        default = 12;
        example = 10;
        description = "The size of the font";
      };
      antialias = mkOption {
        type = types.bool;
        default = true;
        example = false;
        description = "Whether to enable antialias";
      };
      autohint = mkOption {
        type = types.bool;
        default = true;
        example = false;
        description = "Whether to enable autohint";
      };
    };
  };
  config = mkIf config.programs.st.enable {
    environment.systemPackages = [ package ];
  };
}

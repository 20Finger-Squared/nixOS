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

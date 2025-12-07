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
    font = {
      name = mkOption {
        type = types.str;
        default = "Liberation Mono";
        example = "monospace";
      };
      size = mkOption {
        type = types.int;
        default = 12;
        example = 10;
      };
      antialias = mkOption {
        type = types.bool;
        default = true;
        example = false;
      };
      autohint = mkOption {
        type = types.bool;
        default = true;
        example = false;
      };
    };
  };
  config = mkIf config.programs.st.enable {
    environment.systemPackages = [ package ];
  };
}

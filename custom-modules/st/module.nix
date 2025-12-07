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
  };
  config = mkIf cfg.enable { };
}

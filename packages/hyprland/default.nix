{ pkgs }:
let
  conf = pkgs.writeText "conf" (import ./config.nix { inherit pkgs; });
in
pkgs.writeShellScriptBin "hyprland" ''
  exec ${pkgs.hyprland}/bin/hyprland -c ${conf} "$@"
''

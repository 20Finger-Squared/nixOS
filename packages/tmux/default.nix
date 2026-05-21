{ pkgs }:
let
  tmux-conf = pkgs.writeText "conf" (import ./config.nix { inherit pkgs; });
in
pkgs.writeShellScriptBin "tmux" ''
  exec ${pkgs.tmux}/bin/tmux -f ${tmux-conf} "$@"
''

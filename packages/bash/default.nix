{ pkgs }:
let
  dot-bashrc = pkgs.writeText "dot-bashrc" (import ./bash-config.nix { inherit pkgs; });
in
pkgs.symlinkJoin {
  name = "bash";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.bash ];
  postBuild = ''
    wrapProgram $out/bin/bash \
      --append-flags "--rcfile ${dot-bashrc}"
  '';
}

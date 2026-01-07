{ pkgs }:
let
  conf = pkgs.writeText "conf" (import ./config.nix { inherit pkgs; });
in
pkgs.symlinkJoin {
  name = "sway-wrapped";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.sway ];
  postBuild = ''
    wrapProgram $out/bin/sway \
      --append-flags "-c ${conf}"
  '';
}

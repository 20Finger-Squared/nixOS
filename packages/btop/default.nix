{ pkgs }:
let
  config = pkgs.writeText "conf" (import ./config.nix { });
in
pkgs.symlinkJoin {
  name = "btop";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.btop ];
  postBuild = ''
    wrapProgram $out/bin/btop \
      --append-flags "-c ${config}"
  '';
}

{ pkgs }:
let
  config = pkgs.writeText "conf" (import ./conf.nix { inherit pkgs; });
in
pkgs.symlinkJoin {
  name = "dunst";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.dunst ];
  postBuild = ''
    wrapProgram $out/bin/dunst \
      --append-flags "-conf ${config}"
  '';
}

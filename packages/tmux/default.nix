{ pkgs }:
let
  tmux-conf = pkgs.writeText "conf" (import ./tmux.nix { inherit pkgs; });
in
pkgs.symlinkJoin {
  name = "tmux";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.tmux ];
  postBuild = ''
    wrapProgram $out/bin/tmux \
      --append-flags "-f ${tmux-conf}"
  '';
}

{ pkgs, colourscheme }:
let
  config = pkgs.writeText "conf" (import ./config.nix { inherit colourscheme; });
in
pkgs.symlinkJoin {
  name = "qutebrowser";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.qutebrowser ];
  postBuild = ''
    wrapProgram $out/bin/qutebrowser \
      --append-flags "--config-py ${config}"
  '';
}

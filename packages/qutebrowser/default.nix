{
  pkgs,
  nixpkgs-24-11,
  colorscheme,
  ...
}:
let
  config = pkgs.writeText "conf" (import ./config.nix { inherit colorscheme; });
in
pkgs.symlinkJoin {
  name = "qutebrowser";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ nixpkgs-24-11.qutebrowser ];
  postBuild = ''
    wrapProgram $out/bin/qutebrowser \
      --append-flags "--config-py ${config}"
  '';
}

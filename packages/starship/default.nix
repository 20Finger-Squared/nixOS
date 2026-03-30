{
  pkgs,
  colorscheme,
}:
let
  config = pkgs.writeText "starship.toml" (import ./conf.nix { inherit colorscheme; });
in
pkgs.symlinkJoin {
  name = "starship";
  buildInputs = [ pkgs.makeWrapper ];
  paths = [ pkgs.starship ];
  postBuild = ''
    wrapProgram $out/bin/starship --set STARSHIP_CONFIG ${config}
  '';
}

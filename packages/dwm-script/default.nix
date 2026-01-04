{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "dwm-script";
  pname = "dwm-script";
  src = ./.;

  nativeBuildInputs = [ pkgs.clang ];
  buildInputs = [ ];

  buildPhase = "clang -O3 dwm.c -o dwm-script";
  installPhase = "mkdir -p $out/bin; install -t $out/bin dwm-script";
}

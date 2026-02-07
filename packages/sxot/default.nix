{
  pkgs,
}:
pkgs.stdenv.mkDerivation {
  name = "sxot";
  pname = "sxot";
  src = pkgs.fetchgit {
    url = "https://codeberg.org/NRK/sxot";
    rev = "cfed116ba9";
    sha256 = "sha256-fEkvcMcWvaMNG4zmJ6klDPk9PCbWMB9eIYinfsRRH+Y";
  };

  nativeBuildInputs = [
    pkgs.clang
    pkgs.xorg.libX11
    pkgs.xorg.libXfixes
  ];

  buildPhase = "$CC -o sxot sxot.c -O3 -s -l X11 -l Xfixes";
  installPhase = "mkdir -p $out/bin; install -t $out/bin sxot";
}

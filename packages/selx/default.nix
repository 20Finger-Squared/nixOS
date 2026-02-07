{
  pkgs,
}:
pkgs.stdenv.mkDerivation {
  name = "selx";
  pname = "selx";
  src = pkgs.fetchgit {
    url = "https://codeberg.org/NRK/selx";
    rev = "59bdc209c2";
    sha256 = "sha256-c63zOA1YQNJztwiDFuze/I7MaCi5op2gPCq9Tiz4vfE=";
  };

  nativeBuildInputs = [
    pkgs.clang
    pkgs.xorg.libX11
    pkgs.xorg.libXfixes
    pkgs.xorg.libXrandr
  ];

  buildPhase = "$CC -o selx selx.c -O3 -s -l X11 -l Xrandr";
  installPhase = "mkdir -p $out/bin; install -t $out/bin selx";
}

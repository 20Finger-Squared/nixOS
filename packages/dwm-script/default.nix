{
  pkgs,
}:
pkgs.stdenv.mkDerivation {
  name = "dwm-script";
  pname = "dwm-script";
  src = pkgs.fetchgit {
    url = "https://github.com/20Finger-Squared/dwm-script.git";
    rev = "2ee3d97";
    sha256 = "sha256-k4G7q2jzbh8duKgaOexhQHdI4prFM0uaJmgDg2KIezk";
  };

  nativeBuildInputs = [ pkgs.clang ];

  buildPhase = "
   export USE_AWK=/usr/bin/gawk
   export USE_INSTALL=/usr/bin/install
   export USE_CC_COMPILERS='gcc-4.8 gcc-4.9 gcc-6 clang'
   export USE_CXX_COMPILERS='g++-4.8 g++-4.9 g++-6 clang++'
   export PREFIX=/opt/cheusov/mk-configure
   bmake configure
   bmake all
  ";
  installPhase = "mkdir -p $out/bin; install -t $out/bin mk-configure";
}

{
  pkgs,
}:
pkgs.stdenv.mkDerivation {
  name = "dwm-script";
  pname = "dwm-script";
  src = pkgs.fetchgit {
    url = "https://github.com/20Finger-Squared/dwm-script.git";
    rev = "ca44367";
    sha256 = "sha256-ESRz7vFti3bi/GfuTBbDAQmdKSix4GpBXaTygUS4ljc";
  };

  nativeBuildInputs = [ pkgs.clang ];

  buildPhase = "$CC -O3 dwm.c -o dwm-script";
  installPhase = "mkdir -p $out/bin; install -t $out/bin dwm-script";
}

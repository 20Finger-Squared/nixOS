{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "mk-configure";
  pname = "mk-configure";
  src = pkgs.fetchurl {
    url = "mirror://sourceforge/mk-configure/mk-configure-0.38.0.tar.gz";
    sha256 = ""; # fill in
  };
  nativeBuildInputs = [
    pkgs.bmake
    pkgs.makedepend
  ];
  buildPhase = ''
    echo "=== Looking for mkc_check_prog ==="
    find . -name 'mkc_check_prog'
    echo "=== Top-level dirs ==="
    ls -la
    echo "=== mk/ contents (if exists) ==="
    ls -la mk/ 2>/dev/null || echo "no mk/ dir"
    exit 1
  '';
  installPhase = "true";
}

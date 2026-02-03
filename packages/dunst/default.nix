{
  pkgs,
  colorscheme,
}:
let
  config = pkgs.writeText "dunstrc" (import ./conf.nix { inherit colorscheme; });

  wrapped = pkgs.symlinkJoin {
    name = "dunst-wrapped";
    buildInputs = [ pkgs.makeWrapper ];
    paths = [ pkgs.dunst ];
    postBuild = ''
      wrapProgram $out/bin/dunst \
        --add-flags "-config ${config}"
    '';
  };
in
pkgs.runCommand "dunst-with-dbus"
  {
    buildInputs = [ pkgs.makeWrapper ];
  }
  ''
      mkdir -p $out/bin
      mkdir -p $out/share/dbus-1/services

      # Copy binaries
      ln -s ${wrapped}/bin/dunst $out/bin/dunst
      ln -s ${wrapped}/bin/dunstctl $out/bin/dunstctl
      ln -s ${wrapped}/bin/dunstify $out/bin/dunstify

      cat > $out/share/dbus-1/services/org.knopwob.dunst.service <<EOF
    [D-BUS Service]
    Name=org.freedesktop.Notifications
    Exec=${wrapped}/bin/dunst
    EOF
  ''

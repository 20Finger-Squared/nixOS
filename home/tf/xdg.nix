{ ... }:
{
  # XDG portal config
  xdg.configFile."xdg-desktop-portal/portals.conf".text = ''
    [preferred]
    default=wlr;gtk
  '';

  xdg.configFile."xdg-desktop-portal-wlr/config".text = ''
    [screencast]
    max_fps=30
    output_name=
    chooser_type=simple
    chooser_cmd=slurp -f %o -or
  '';
}

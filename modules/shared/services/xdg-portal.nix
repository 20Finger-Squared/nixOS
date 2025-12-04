{ pkgs, ... }:
{
  xdg = {
    portal = {
      enable = true;
      wlr.enable = true; # Enables xdg-desktop-portal-wlr

      config = {
        common = {
          default = [
            "wlr"
            "gtk"
          ];
        };
      };

      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}

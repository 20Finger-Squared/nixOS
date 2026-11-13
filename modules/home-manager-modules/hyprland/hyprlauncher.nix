{ lib, config, ... }:
{
  options.home-manager-config.hyprlauncher = lib.mkEnableOption "My home-manager hyprlauncher config";
  config = lib.mkIf config.home-manager-config.hyprlauncher {
    services.hyprlauncher = {
      enable = true;
      settings = {
        cache = true;
        general.grab_focus = true;
        finders.desktop_icons = true;
        ui.window_size = "800 520";
      };
    };
  };
}

{ mkConfig, ... }@module-args:
mkConfig.home.software "hyprlauncher" module-args
{
    services.hyprlauncher = {
      enable = true;
      settings = {
        cache = true;
        general.grab_focus = true;
        finders.desktop_icons = true;
        ui.window_size = "800 520";
      };
    };
}

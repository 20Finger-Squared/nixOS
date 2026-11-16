{ mkConfig, ...}@module-args:
mkConfig.home.software "hyprpolkitagent" module-args {
    services.hyprpolkitagent = {
      enable = true;
    };
}

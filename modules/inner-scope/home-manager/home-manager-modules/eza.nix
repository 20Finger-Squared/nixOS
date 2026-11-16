{ mkConfig, ... }@module-args:
mkConfig.home.software "eza" module-args {
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };
}

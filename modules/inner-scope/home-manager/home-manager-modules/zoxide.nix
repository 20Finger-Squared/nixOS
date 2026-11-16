{ mkConfig, ... }@module-args:
mkConfig.home.software "zoxide" module-args {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
}

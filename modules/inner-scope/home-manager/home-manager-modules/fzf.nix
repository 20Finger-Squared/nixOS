{ mkConfig, ...}@module-args:
mkConfig.home.software "fzf" module-args {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      tmux.enableShellIntegration = true;
    };
}

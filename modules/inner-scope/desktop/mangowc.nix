{ mkConfig, ... }@module-args:
mkConfig.desktop "mangowc" module-args{
  programs.mangowc.enable = true;
}

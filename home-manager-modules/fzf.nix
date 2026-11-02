{ lib, config, ... }:
{
  options.home-manager-config.fzf = lib.mkEnableOption "My home-manager fzf config";
  config = lib.mkIf config.home-manager-config.fzf {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      tmux.enableShellIntegration = true;
    };
  };
}

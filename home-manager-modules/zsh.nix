{ config, lib, ... }:
{
  options.home-manager-config.zsh = lib.mkEnableOption "My home-manager zsh config";
  config = lib.mkIf config.home-manager-config.zsh {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      sessionVariables.FZF_DEFAULT_OPTS = "--height=1% --reverse --border=bold --border-label='FZF'";

      history = {
        expireDuplicatesFirst = true;
        saveNoDups = true;
        ignoreDups = true;
        append = true;
      };

      shellAliases = {
        "ls" = "eza -G --icons=auto --group-directories-first -F";
        "cd" = "z";
      };

      setOptions = [
        "AUTO_PUSHD"
        "PUSHD_IGNORE_DUPS"
        "PUSHD_SILENT"
        "EXTENDED_GLOB"
        "NO_CLOBBER"
        "MENU_COMPLETE"
        "ALWAYS_TO_END"
        "NO_BEEP"
        "CORRECT"
      ];
    };
  };
}

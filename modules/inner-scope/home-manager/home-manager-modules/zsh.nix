{ mkConfig, ... }@module-args:
mkConfig.home.software "zsh" module-args {
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

      initContent = ''
      if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
        [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}
      fi'';


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
}

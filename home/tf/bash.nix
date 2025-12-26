{ pkgs, ... }:

{
  home.packages = [
    pkgs.starship
    pkgs.zoxide
  ];
  programs.zoxide.enable = true;
  programs.zoxide.enableBashIntegration = true;

  programs.starship.enable = true;
  programs.starship.enableBashIntegration = true;

  programs.bash = {
    enable = true;
    initExtra = /* sh */ ''
      if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
        if tmux ls &> /dev/null; then
            tmux attach
        else
            tmux
        fi
      fi
    '';
    shellAliases = {
      "cd" = "z";
      ".." = "z ..";
      "ls" = "eza -G --icons -F --group-directories-first";
      "rebuild" = "nh os switch";
      "please" = "sudo $(fc -ln -1)";
    };
  };
}

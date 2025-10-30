{ config, pkgs, ...}:

{
  programs.bash = {
      enable = true;
      bashrcExtra = ''
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    if tmux ls &> /dev/null; then
        tmux attach
    else
        tmux
    fi
fi
      '';
      shellAliases = {
          ".." = "cd ..";
          "ls" = "eza -G --icons -F --group-directories-first";
          "rebuild" = "sudo nixos-rebuild switch --flake ~/nixOS/#tf";
          "please" = "sudo $(fc -ln -1)";
      };
  };
  programs.zoxide.enableBashIntegration = true;
  programs.starship.enableBashIntegration = true;
}

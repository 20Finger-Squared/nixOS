{ pkgs, ... }:
{
  home.packages = [ pkgs.tmux ];
  programs.tmux = {
    enable = true;
    baseIndex = 0;
    clock24 = true;
    keyMode = "vi";
    mouse = false;
    prefix = "C-Space";
    extraConfig = ''
      set -g focus-events on
      set -g status-style bg=default
      set -g status-left-length 99
      set -g status-right-length 99
      set -g status-justify centre

      set-option -sg escape-time 10
      set-option -g focus-events on
      set-option -g default-terminal "screen-256color"
    '';
  };
}

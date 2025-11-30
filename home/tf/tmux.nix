{ pkgs, colorscheme, ... }:
{
  home.packages = [ pkgs.tmux ];
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    keyMode = "vi";
    mouse = false;
    prefix = "C-Space";
    extraConfig = ''
      set -g focus-events on
      set -g status-style bg=default
      set -g status-left-length 10
      set -g status-right-length 10
      set -g status-justify centre

      # status bar settings
      set -g status-position top
      set -g status-left  "#{session_name} #{?client_prefix,#[bg=${colorscheme.hex.muted.red}]PREFIX#[default],} "

      set-option -sg escape-time 10
      set-option -g focus-events on
      set-option -g default-terminal "screen-256color"
    '';
  };
}

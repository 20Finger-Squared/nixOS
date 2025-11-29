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


      # status bar settings
      set -g status-position top
      set -g status-left  "#{session_name} #{?client_prefix,#[bg=red]PREFIX#[default],} "
      set -g status-right "#{host} %Y-%m-%d %H:%M #{ram_percentage}"

      set-option -sg escape-time 10
      set-option -g focus-events on
      set-option -g default-terminal "screen-256color"
    '';
  };
}

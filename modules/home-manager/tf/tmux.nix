{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    historyLimit = 2000;
    keyMode = "vi";

    focusEvents = true;
    extraConfig = ''
      set -g status-style bg=default
      set -g status-left-length 10
      set -g status-right-length 10
      set -g status-justify centre
      # status bar settings
      set -g status-position top
      set -g status-left  "#{session_name} #{?client_prefix,#[bg=#fb4934]PREFIX#[default],} "
      set-option -g focus-events on
      set-option -g default-terminal "st-256color"
    '';
  };
}

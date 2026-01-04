{ pkgs }:
''
  set  -g base-index      1
  setw -g pane-base-index 1

  set -g status-keys vi
  set -g mode-keys   vi

  # rebind main key: C-Space
  unbind C-b
  set -g prefix C-Space
  bind -N "Send the prefix key through to the application" \
    C-Space send-prefix

  set  -g mouse             off
  setw -g aggressive-resize off
  setw -g clock-mode-style  24
  set  -g history-limit     2000

  set -g focus-events on
  set -g status-style bg=default
  set -g status-left-length 10
  set -g status-right-length 10
  set -g status-justify centre
  # status bar settings
  set -g status-position top
  set -g status-left  "#{session_name} #{?client_prefix,#[bg=#fb4934]PREFIX#[default],} "
  set-option -g focus-events on
  set-option -g default-terminal "st-256color"
''

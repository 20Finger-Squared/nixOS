{ pkgs }:
# sh
''
  # Commands that should be applied only for interactive shells.
  [[ $- == *i* ]] || return

  HISTFILESIZE=100000
  HISTSIZE=10000

  shopt -s histappend
  shopt -s checkwinsize
  shopt -s extglob
  shopt -s globstar
  shopt -s checkjobs

  alias ..='z ..'
  alias cd=z
  alias ls='eza -G --icons -F --group-directories-first'
  alias please='sudo $(fc -ln -1)'
  alias rebuild='nh os switch'
  if [[ ! -v BASH_COMPLETION_VERSINFO ]]; then
   . "${pkgs.bash-completion}/etc/profile.d/bash_completion.sh"
  fi


  if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    if tmux ls &> /dev/null; then
        tmux attach
    else
        tmux
    fi
  fi

  if [[ $TERM != "dumb" ]]; then
    eval "$(starship init bash --print-full-init)"
  fi

  eval "$(zoxide init bash )"
''

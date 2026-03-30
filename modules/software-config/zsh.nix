{
  lib,
  config,
  pkgs,
  my-pkgs,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
in
{
  options.software-config.zsh.enable = mkEnableOption "my zsh config";
  config = mkIf config.software-config.zsh.enable {
    environment.systemPackages = [
      pkgs.zoxide
      my-pkgs.starship
    ];
    programs.zsh = {
      enable = true;
      autosuggestions.enable = true;
      enableCompletion = true;
      setOptions = [
        "HIST_IGNORE_DUPS"
        "SHARE_HISTORY"
        "HIST_FCNTL_LOCK"
        "AUTO_CD" # type a directory name to cd into it
        "CORRECT" # suggest corrections for mistyped commands
        "EXTENDED_HISTORY" # timestamps in history
        "HIST_IGNORE_SPACE" # don't save commands prefixed with a space
        "HIST_VERIFY" # confirm history expansion before running
        "PUSHD_IGNORE_DUPS" # no duplicate dirs in stack
        "AUTO_PUSHD" # cd automatically pushes to dir stack (use popd to go back)
      ];
      shellAliases = {
        ".." = "cd ..";
        cd = "z";
        ls = "eza -G --icons -F --group-directories-first";
        sl = "ls"; # a common typo i make
        nix-switch = "nh os switch";
        nix-build = "nh os build";
      };
      interactiveShellInit = ''
        function cd() { z "$@" }
        if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
          if tmux ls &> /dev/null; then
              tmux attach
          else
              tmux
          fi
        fi
      '';
    };
    programs.starship = {
      enable = true;
      package = my-pkgs.starship;
    };
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true; # note: you also have a typo here — "Intergration"
    };
  };
}

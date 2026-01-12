{
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
in
{
  options.software-config.bash.enable = mkEnableOption "my bash config";
  config = mkIf config.software-config.bash.enable {
    environment.systemPackages = [
      pkgs.zoxide
      pkgs.starship
    ];
    programs.bash = {
      completion.enable = true;
      shellAliases = {
        ".." = "cd ..";
        cd = "z";
        ls = "eza -G --icons -F --group-directories-first";
        nix-switch = "nh os switch";
        nix-build = "nh os build";
      };
      interactiveShellInit = ''
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
      '';
    };
    programs.zoxide.enableBashIntegration = true;
    programs.zoxide.enable = true;
  };
}

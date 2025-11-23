{ pkgs, ... }:
{
  home.packages = [ pkgs.tmux ];
  programs.tmux = {
    baseIndex = 0;
    clock24 = true;
    keyMode = "vi";
    mouse = false;
    prefix = "CTRL-Space";
  };
}

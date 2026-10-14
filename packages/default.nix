{ pkgs, ... }:
{
  tmux = import ./tmux { inherit pkgs; };
  hyprland = import ./hyprland { inherit pkgs; };
  qutebrowser = import ./qutebrowser { inherit pkgs; };
  limusic = pkgs.callPackage ./limusic { };
}

{ pkgs, colourscheme, ... }:
{
  tmux = import ./tmux { inherit pkgs; };
  hyprland = import ./hyprland { inherit pkgs; };
  qutebrowser = import ./qutebrowser { inherit pkgs colourscheme; };
}

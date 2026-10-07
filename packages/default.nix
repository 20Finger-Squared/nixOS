{
  pkgs,
  colourscheme,
  inputs,
  ...
}:
{
  tmux = import ./tmux { inherit pkgs; };
  hyprland = import ./hyprland { inherit pkgs; };
  qutebrowser = import ./qutebrowser { inherit pkgs colourscheme; };
  limusic = pkgs.callPackage ./limusic { };
}

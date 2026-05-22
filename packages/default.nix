{
  pkgs,
}:
{
  tmux = import ./tmux { inherit pkgs; };
  hyprland = import ./hyprland { inherit pkgs; };
}

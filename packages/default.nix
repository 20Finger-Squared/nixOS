{ pkgs, colorscheme }:
{
  dwm-script = import ./dwm-script { inherit pkgs; };
  bash = import ./bash { inherit pkgs; };
  tmux = import ./tmux { inherit pkgs; };
  sway = import ./sway { inherit pkgs; };
}

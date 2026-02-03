{ pkgs, colorscheme }:
{
  dwm-script = import ./dwm-script { inherit pkgs; };
  dunst = import ./dunst {
    inherit pkgs;
    inherit colorscheme;
  };
  bash = import ./bash { inherit pkgs; };
  tmux = import ./tmux { inherit pkgs; };
  sway = import ./sway { inherit pkgs; };
}

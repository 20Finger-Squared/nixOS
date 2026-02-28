{
  nixpkgs-24-11,
  pkgs,
  colorscheme,
}:
{
  btop = import ./btop { inherit pkgs; };
  sxot = import ./sxot { inherit pkgs; };
  selx = import ./selx { inherit pkgs; };
  dunst = import ./dunst {
    inherit pkgs;
    inherit colorscheme;
  };
  bash = import ./bash { inherit pkgs; };
  tmux = import ./tmux { inherit pkgs; };
  sway = import ./sway { inherit pkgs; };
  qutebrowser = import ./qutebrowser {
    inherit pkgs nixpkgs-24-11 colorscheme;
  };
}

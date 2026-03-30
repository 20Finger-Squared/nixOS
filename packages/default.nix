{
  nixpkgs-24-11,
  pkgs,
  colorscheme,
}:
{
  btop = import ./btop { inherit pkgs; };
  sxot = import ./sxot { inherit pkgs; };
  selx = import ./selx { inherit pkgs; };
  starship = import ./starship { inherit pkgs colorscheme; };
  dunst = import ./dunst {
    inherit pkgs colorscheme;
  };
  bash = import ./bash { inherit pkgs; };
  tmux = import ./tmux { inherit pkgs; };
  sway = import ./sway { inherit pkgs; };
  qutebrowser = import ./qutebrowser {
    inherit pkgs nixpkgs-24-11 colorscheme;
  };
}

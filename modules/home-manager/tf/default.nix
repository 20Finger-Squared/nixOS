{ pkgs, ... }:

{
  imports = [
    ./gtk.nix
    ./neovim
    ./zsh.nix
    ./fzf.nix
    ./starship.nix
    ./zoxide.nix
    ./eza.nix
    ./qutebrowser.nix
  ];
  home = {
    stateVersion = "26.05";
  };
}

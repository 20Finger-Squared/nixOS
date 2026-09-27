{ pkgs, ... }:

{
  imports = [
    ./gtk.nix
    ./neovim
  ];
  home = {
    stateVersion = "26.05";
  };
}

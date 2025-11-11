{ lib, pkgs, ... }:

{

  home.username = "tf";
  home.homeDirectory = lib.mkForce "/home/tf";
  home.stateVersion = "25.05";

  imports = [
    ./nvim/nvim.nix

    ./sway.nix # wm
    ./sway-lock.nix # lock

    ./kitty.nix # terminal
    ./bash.nix # shell

    ./firefox.nix # web browser

    ./gtk.nix # gtk
  ];

  home.packages = [
    pkgs.zsh
    pkgs.mesa
    pkgs.discord
    pkgs.gruvbox-dark-gtk
    pkgs.gruvbox-dark-icons-gtk
    ./git.nix # git conf
  ];

  programs.home-manager.enable = true;
}

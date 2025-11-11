{ lib, ... }:

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

  ];
  home.packages = [
    pkgs.mesa
    pkgs.discord
    ./git.nix # git conf
  ];

  programs.home-manager.enable = true;
}

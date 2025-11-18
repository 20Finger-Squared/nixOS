{ lib, ... }:

{
  home.username = "tf";
  home.homeDirectory = lib.mkForce "/home/tf";

  imports = [
    ./nvim/nvim.nix

    ./sway.nix # wm
    ./sway-lock.nix # lock

    ./kitty.nix # terminal
    ./bash.nix # shell

    ./firefox.nix # web browser
    ./git.nix # git conf
  ];

}

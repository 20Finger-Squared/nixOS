{ lib, ... }:

{
  home.username = "tf";
  home.homeDirectory = lib.mkForce "/home/tf";

  imports = [
    ./nvim/default.nix

    ./sway.nix # wm
    ./sway-lock.nix # lock

    ./kitty.nix # terminal
    ./bash.nix # shell
    ./tmux.nix # terminal multiplexer

    ./qutebrowser.nix # vim like web browser
    ./git.nix # git conf
  ];

}

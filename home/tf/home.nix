{ lib, ... }:

{
  home.username = "tf";
  home.homeDirectory = lib.mkForce "/home/tf";

  imports = [
    ./nvim/default.nix

    ./sway.nix # wm
    ./sway-lock.nix # lock

    ./kitty.nix # terminal
    ./tmux.nix # terminal multiplexer
    # ./bash.nix # shell

    ./qutebrowser.nix # vim like web browser
    ./git.nix # git conf
  ];

}

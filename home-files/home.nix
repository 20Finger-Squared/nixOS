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
    pkgs.git
    pkgs.zsh
    pkgs.starship
    pkgs.fuzzel
    pkgs.tmux
    pkgs.fuzzel
    pkgs.mesa
    pkgs.discord
    pkgs.zoxide
    pkgs.mako
  ];


  programs.home-manager.enable = true;
  programs.git.enable          = true;
  programs.starship.enable     = true;

  programs.zoxide.enable = true;
  programs.zoxide.enableBashIntegration = true;

  programs.starship.enableBashIntegration = true;

  programs.git.userEmail = "orhylie@gmail.com";
  programs.git.userName  = "20Finger-Squared";
}

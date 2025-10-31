{ lib, pkgs, ... }:

{

  home.username = "tf";
  home.homeDirectory = lib.mkForce "/home/tf";
  home.stateVersion = "25.05";



  imports = [
  	./nvim/nvim.nix
	./sway.nix
    ./bash.nix
    ./kitty.nix
    ./firefox.nix
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
  ];


  programs.home-manager.enable = true;
  programs.git.enable          = true;
  programs.starship.enable     = true;

  programs.zoxide.enableBashIntegration = true;
  programs.starship.enableBashIntegration = true;

  programs.git.userEmail = "orhylie@gmail.com";
  programs.git.userName  = "20Finger-Squared";

}

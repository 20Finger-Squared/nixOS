{ config, pkgs, ... }:

{

  home.username = "tf";
  home.homeDirectory = pkgs.lib.mkForce "/home/tf";
  home.stateVersion = "25.05";

  imports = [
  	./nvim/nvim.nix
	./sway.nix
    ./bash.nix
    ./kitty.nix
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
  ];


  programs.home-manager.enable = true;
  programs.starship.enable     = true;
  programs.git.enable          = true;

  programs.git.userEmail = "orhylie@gmail.com";
  programs.git.userName  = "20Finger-Squared";

}

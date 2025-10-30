{ config, pkgs, ... }:

{
  home.username = "tf";
  home.homeDirectory = pkgs.lib.mkForce "/home/tf";
  home.stateVersion = "25.05";

  imports = [
  	./nvim/nvim.nix
	./sway.nix
  ];
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.git
    pkgs.zsh
    pkgs.starship
    pkgs.fuzzel
    pkgs.tmux
    pkgs.fuzzel
    pkgs.mesa
  ];

  programs.zsh.enable = true;
  programs.starship.enable = true;

}

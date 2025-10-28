{ config, pkgs, ... }:

{
  home.username = "rhylie";
  home.homeDirectory = "/home/rhylie";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    neovim
    git
    zsh
    starship
    sway
    fuzzel
  ];

  programs.zsh.enable = true;
  programs.starship.enable = true;
}

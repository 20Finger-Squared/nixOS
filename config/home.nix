{ pkgs, ... }:
{
  home.stateVersion = "25.05";
  home.username = "rhylie";
  home.homeDirectory = "/home/rhylie";
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  imports = [
    ./programs/neovim/default.nix
    ./programs/git.nix
    ./programs/kitty.nix
    ./programs/sway.nix
    ./programs/zsh.nix
    ./programs/rofi.nix
  ];

  # Font configuration
  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
}

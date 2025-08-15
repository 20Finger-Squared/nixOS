{ pkgs, ... }:
{
    home.stateVersion = "25.05";
    home.username = "rhylie";
    home.homeDirectory = "/home/rhylie";
    home.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
    ];

    imports = [
        ./config/neovim/default.nix
        ./config/git.nix
        ./config/kitty.nix
        ./config/sway.nix
        ./config/zsh.nix
    ];

# Font configuration
    fonts.fontconfig.enable = true;
    programs.home-manager.enable = true;
}

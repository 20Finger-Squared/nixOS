{ config, nix-colors, pkgs, ... }:
{
    home.stateVersion = "25.05";
    home.username = "rhylie";
    home.homeDirectory = "/home/rhylie";

    imports = [
        nix-colors.homeManagerModules.default
        ./config/neovim/default.nix
        ./config/git.nix
        ./config/kitty.nix
        ./config/zsh.nix
    ];
    colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;

# Font configuration
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
    ];

    programs.home-manager.enable = true;

    programs.zoxide = {
            enable = true;
            enableZshIntegration = true;
        };
}

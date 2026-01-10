{ pkgs, ... }:
{
  fonts = {
    packages = [
      pkgs.noto-fonts-color-emoji
      pkgs.nerd-fonts.jetbrains-mono
    ];

    fontconfig.defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}

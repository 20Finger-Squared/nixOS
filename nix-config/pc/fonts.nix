{ pkgs, ... }:
{
  packages = [
    pkgs.noto-fonts-emoji
    pkgs.nerd-fonts.jetbrains-mono
  ];

  fontconfig.defaultFonts = {
    monospace = [ "JetBrainsMono Nerd Font" ];
    emoji = [ "Noto Color Emoji" ];
  };
}

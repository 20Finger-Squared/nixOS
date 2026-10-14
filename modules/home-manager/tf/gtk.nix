{ pkgs, ... }:
{
  gtk = {
    enable = true;
    colorScheme = "dark";

    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };

    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
    };

    font = {
      name = "Jetbrains Mono NF";
      size = 13;
      package = pkgs.nerd-fonts.jetbrains-mono;
    };
  };
}

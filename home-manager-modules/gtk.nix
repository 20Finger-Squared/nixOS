{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.home-manager-config.gtk = lib.mkEnableOption "My home-manager gtk config";
  config = lib.mkIf config.home-manager-config.gtk {
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
  };
}

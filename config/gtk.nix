{ pkgs, ... }:

{
    gtk = {
        enable = true;
        theme = {
            package = pkgs.gruvbox-gtk-theme;
            name = "Gruvbox-Dark";
        };
        iconTheme = {
            package = pkgs.papirus-icon-theme;
            name = "Papirus-Dark";
        };
    };
}

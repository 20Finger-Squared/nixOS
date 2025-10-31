{ pkgs, ...}:
{
programs.gtk = {
        font = {
                size = 11;
                package = [ pkgs.nerd-fonts.jetbrains-mono];
                name = "JetBrainsMono Nerd Font";
            };
        IconTheme = {
                package = [ pkgs.gruvbox-dark-icons-gtk ];
                name = "gruvbox-dark-icons-gtk";
            };
        theme = {
            package = [ pkgs.gruvbox-dark-gtk ];
                name = "gruvbox-dark-gtk";
            };
    };
}

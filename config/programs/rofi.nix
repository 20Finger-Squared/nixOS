{ ... }:
{
  programs.rofi = {
    enable = true;
    extraConfig = ''
      configuration {
              font: "JetBrainsMono Nerd Font 12";*/
          }
    '';
    font = "JetBrainsMono Nerd Font";
    theme = "Gruvbox-Dark";
    terminal = "kitty";
  };
}

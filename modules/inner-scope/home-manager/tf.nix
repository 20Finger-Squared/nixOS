{ inputs,... }:
{
  home-manager.users.tf={
    config = {
        home.stateVersion = "26.05";
        software-config = {
          tmux = true;
          gtk = true;
          zoxide = true;
          qutebrowser = true;
          fzf = true;
          zsh = true;
          eza = true;
          starship = true;
          neovim = true;
          vesktop = true;
          kitty = true;
          hyprland = true;
          hyprtoolkit = true;
          hyprlauncher = true;
          quickshell = true;
        };
  };
  };
}

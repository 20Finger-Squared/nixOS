{ lib, pkgs, ... }:

{

  home.username = "tf";
  home.homeDirectory = lib.mkForce "/home/tf";
  home.stateVersion = "25.05";

  imports = [
    ./nvim/nvim.nix

    ./sway.nix # wm
    ./sway-lock.nix # lock

    ./kitty.nix # terminal
    ./bash.nix # shell

    ./firefox.nix # web browser

    ./gtk.nix # gtk
  ];

  home.packages = [
    pkgs.zsh
    pkgs.starship
    pkgs.fuzzel
    pkgs.tmux
    pkgs.mesa
    pkgs.discord
    pkgs.zoxide
    pkgs.mako
    pkgs.gruvbox-dark-gtk
    pkgs.gruvbox-dark-icons-gtk
    ./git.nix # git conf
  ];

  programs.home-manager.enable = true;
  programs.starship.enable = true;

  programs.zoxide.enable = true;
  programs.zoxide.enableBashIntegration = true;

  programs.starship.enableBashIntegration = true;

  # XDG portal config
  xdg.configFile."xdg-desktop-portal/portals.conf".text = ''
    [preferred]
    default=wlr;gtk
  '';

  xdg.configFile."xdg-desktop-portal-wlr/config".text = ''
    [screencast]
    max_fps=30
    output_name=
    chooser_type=simple
    chooser_cmd=slurp -f %o -or
  '';
}

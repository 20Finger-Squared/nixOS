{ pkgs, ... }:

{
  sessionVariables = {
    XDG_BIN_HOME = "$HOME/.bin";
  };

  systemPackages = [
    # tiny unopinonated packages or those of which are not relevant to one particular user
    pkgs.libreoffice

    # wayland needs
    pkgs.wl-clipboard
    pkgs.xdg-desktop-portal

    # dev setup for nixOS
    pkgs.nixfmt-rfc-style # formatter for dot-nix
    pkgs.nil

    # cli tools
    pkgs.tmux
    pkgs.jq
    pkgs.ripgrep
    pkgs.fzf

    pkgs.ly
  ];
}

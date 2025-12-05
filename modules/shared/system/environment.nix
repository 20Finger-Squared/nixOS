{ nixpkgs-24-11, pkgs, ... }:

{
  environment = {
    sessionVariables = {
      XDG_BIN_HOME = "$HOME/.bin";
      EDITOR = "nvim";
    };

    systemPackages = [
      # tiny unopinonated packages or those of which are not relevant to one particular user
      pkgs.libreoffice
      pkgs.firefox

      # wayland needs
      pkgs.wl-clipboard
      pkgs.xdg-desktop-portal

      # dev setup for nixOS
      pkgs.nixfmt-rfc-style # formatter for dot-nix
      pkgs.nil

      # Default terminal emulator
      pkgs.kitty

      # cli tools
      pkgs.tmux
      pkgs.jq
      pkgs.ripgrep
      pkgs.fzf
      pkgs.btop
      pkgs.fastfetch
      pkgs.godot

      pkgs.ly

      nixpkgs-24-11.qutebrowser
    ];
  };
}

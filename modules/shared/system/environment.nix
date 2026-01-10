{
  my-pkgs,
  pkgs,
  nixpkgs-24-11,
  ...
}:
{
  environment = {
    sessionVariables = {
      XDG_BIN_HOME = "$HOME/.bin";
      EDITOR = "nvim";
    };

    systemPackages = [
      my-pkgs.dwm-script
      my-pkgs.tmux
      my-pkgs.sway

      pkgs.fuzzel
      # tiny unopinonated packages or those of which are not relevant to one particular user
      pkgs.vial
      pkgs.via

      # x11 needs
      pkgs.xclip
      pkgs.clipnotify

      # dev setup for nixOS
      pkgs.nixfmt-rfc-style # formatter for dot-nix
      pkgs.nil

      # lsp and C compiler
      pkgs.clang-tools
      pkgs.clang

      # Default terminal emulator
      pkgs.kitty

      # for the dwm background
      pkgs.feh

      # cli tools
      pkgs.ripgrep
      pkgs.fzf
      pkgs.btop
      pkgs.fastfetch
      pkgs.git

      pkgs.ly

      nixpkgs-24-11.qutebrowser
    ];
  };
}

{
  lib,
  config,
  my-pkgs,
  pkgs,
  nixpkgs-24-11,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
in
{
  options.system-config.environment.enable = mkEnableOption "my environment config";
  config = mkIf config.system-config.environment.enable {
    environment = {
      sessionVariables = {
        XDG_BIN_HOME = "$HOME/.bin";
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
  };
}

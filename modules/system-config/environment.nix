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
        my-pkgs.sway

        pkgs.fuzzel

        # Default terminal emulator
        pkgs.kitty

        # cli tools
        pkgs.ripgrep
        pkgs.fzf
        pkgs.btop
        pkgs.fastfetch
        pkgs.git

        nixpkgs-24-11.qutebrowser
      ];
    };
  };
}

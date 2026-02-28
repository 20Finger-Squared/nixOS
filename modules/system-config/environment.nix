{
  lib,
  config,
  my-pkgs,
  pkgs,
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
        my-pkgs.btop

        pkgs.fuzzel

        # Default terminal emulator
        pkgs.kitty

        # cli tools
        pkgs.ripgrep
        pkgs.fzf
        pkgs.fastfetch
        pkgs.git

        my-pkgs.qutebrowser
      ];
    };
  };
}

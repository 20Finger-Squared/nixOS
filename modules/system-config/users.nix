{
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
in
{
  options.system-config.users.enable = mkEnableOption "my user config";
  config = mkIf config.system-config.users.enable {
    users = {
      users.tf = {
        isNormalUser = true;
        description = "Rhylie M. Orton";
        extraGroups = [
          "networkmanager"
          "tty"
          "wheel"
          "render"
          "seat"
          "uinput"
          "input"
          "video"
        ];
        packages = [
          pkgs.lazygit
          pkgs.prismlauncher
          pkgs.discord
          pkgs.eza
          pkgs.steam
          pkgs.thunderbird
        ];
      };
    };
  };
}

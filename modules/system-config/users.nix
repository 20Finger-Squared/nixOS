{
  my-pkgs,
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
        shell = pkgs.zsh;
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
          pkgs.equicord
          pkgs.eza
          pkgs.steam
          pkgs.thunderbird
          pkgs.libreoffice
          pkgs.blender
          pkgs.obsidian
          pkgs.pavucontrol
          pkgs.android-studio
          pkgs.obs-studio
          pkgs.kdePackages.kdenlive
          pkgs.appimage-run
          pkgs.openshot-qt
          pkgs.krita
          my-pkgs.tmux
        ];
      };
    };
  };
}

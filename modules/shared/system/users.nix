{ pkgs, ... }:
{
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
        pkgs.discord
        pkgs.eza
        pkgs.steam
        pkgs.thunderbird
      ];
    };
  };
}

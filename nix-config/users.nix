{ pkgs, ... }:
{
  users.tf = {
    isNormalUser = true;
    description = "Rhylie M. Orton";
    extraGroups = [
      "networkmanager"
      "wheel"
      "render"
      "seat"
      "input"
      "video"
    ];
    packages = [
      pkgs.lazygit
      pkgs.discord
      pkgs.kitty
      pkgs.eza
      pkgs.steam
      pkgs.krita
    ];
  };
}

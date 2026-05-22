{
  lib,
  pkgs,
  my-pkgs,
  ...
}@inputs:
lib.mkSystemOption "users" inputs {
  users.users.tf = {
    isNormalUser = true;
    description = "Rhylie M. Orton";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      firefox
      vesktop
      my-pkgs.tmux
      kitty
      lazygit
      kdePackages.kate
      fastfetch
    ];
  };
}

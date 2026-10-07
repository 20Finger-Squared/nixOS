{
  lib,
  pkgs,
  my-pkgs,
  ...
}@inputs:
lib.mkSystemOption "users" inputs {
  users.users.tf = {
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
    isNormalUser = true;
    description = "Rhylie M. Orton";
    extraGroups = [
      "networkmanager"
      "wheel"
      "openrazer"
      "input-remapper"
    ];
    packages = with pkgs; [
      vesktop
      my-pkgs.tmux
      kitty
      lazygit
      kdePackages.kate
      fastfetch
      prismlauncher
      teamspeak6-client
      obs-studio
      my-pkgs.limusic
      pkgs.azahar
    ];
  };
  programs.firefox.enable = true;
}

{
  pkgs,
  ...
}:

{
  # User configuration
  users = {
    users.rhylie = {
      isNormalUser = true;
      description = "Rhylie";
      useDefaultShell = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
      packages = [
        pkgs.aseprite
        pkgs.discord
        pkgs.zoxide
        pkgs.eza
        pkgs.fastfetch
        pkgs.btop
        pkgs.pavucontrol
        pkgs.lazygit
      ];
    };
    defaultUserShell = pkgs.zsh;
  };
}

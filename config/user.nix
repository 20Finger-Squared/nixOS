{ pkgs }:
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
      packages = with pkgs; [
        aseprite
        discord
        zoxide
        eza
        fastfetch
        btop
      ];
    };
    defaultUserShell = pkgs.zsh;
  };
}

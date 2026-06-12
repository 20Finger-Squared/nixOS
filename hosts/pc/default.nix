{
  config,
  my-pkgs,
  pkgs,
  ...
}:
{

  software-config = {
    git = true;
    neovim = true;
    nh = true;
  };

  system-config = {
    audio = true;
    boot = true;
    bluetooth = true;
    fonts = true;
    keyboard = true;
    network = true;
    nix = true;
    printing = true;
    security = true;
    users = true;
  };

  desktop-config = {
    plasma = true;
    hyprland = true;
  };

  networking.hostName = "pc";
  system.stateVersion = "25.11";
}

{ ... }:
{
  imports = [
    ./environment.nix
    ./fonts.nix
    ./locale.nix
    ./nix-settings.nix
    ./swap.nix
    ./users.nix
    ./console.nix
    ./hardware.nix
    ./services.nix
    ./networking.nix
    ./boot.nix
    ./misc.nix
  ];
}

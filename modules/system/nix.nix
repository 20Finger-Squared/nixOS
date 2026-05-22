{ lib, ... }@inputs:
lib.mkSystemOption "nix" inputs {
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;
}

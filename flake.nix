{
  description = "NixOS configuration for tf";

  inputs = {
    nixpkgs-24-11.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05"; # Correct channel for NixOS 25
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: import ./outputs.nix inputs;
}

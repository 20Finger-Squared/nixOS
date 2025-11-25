{
  description = "NixOS configuration for tf";

  inputs = {
    nixpkgs-24-11.url = "github:NixOS/nixpkgs/5eb803c7b22ee6f4ef62cfd9605f2b2c2555502c";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05"; # Correct channel for NixOS 25
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: import ./outputs.nix inputs;
}

{
  description = "NixOS configuration for rhylie";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";  # Correct channel for NixOS 25
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations.rhylie = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ];  # Ensure this path is correct
    };
  };
}

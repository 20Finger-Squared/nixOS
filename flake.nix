{
  description = "NixOS configuration for rhylie";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";  # Correct channel for NixOS 25
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ...}: {
    nixosConfigurations.rhylie = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.rhylie = import ./home.nix;
        }
      ];
    };
  };
}

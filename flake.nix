{
  description = "NixOS configuration for tf";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";  # Correct channel for NixOS 25
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ...}: {
    nixosConfigurations.tf = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.tf = import ./home-files/home.nix;
        }
      ];
    };
  };
}

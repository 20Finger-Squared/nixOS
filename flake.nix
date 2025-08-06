{
    description = "Rhylie's NixOS configuration";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        stylix.url = "github:nix-community/stylix/release-25.05";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { self, nixpkgs, home-manager, stylix}@inputs:  # Added nix-colors here
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in {
        nixosConfigurations = {
            rhyliePC = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = {inherit inputs;};
                modules = [
                    ./configuration.nix
                    stylix.nixosModules.stylix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.backupFileExtension = "bak";
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.rhylie = import ./home.nix;
                    }
                ];
            };
        };
    };
}

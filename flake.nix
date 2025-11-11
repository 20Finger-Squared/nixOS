{
  description = "NixOS configuration for tf";

  inputs = {

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05"; # Correct channel for NixOS 25
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

      nixosConfigurations.tf = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          home-manager.nixosModules.home-manager.home-manager
          {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = ".bak";

            users.tf = {
              _module.args = { inherit inputs; };
              imports = [ ./home-files/home.nix ];
            };

          }

          ./nix-config/configuration.nix
        ];
      };
    };
}

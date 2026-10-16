{
  description = "My conf";

  outputs =
    { ... }@inputs:
    let
      extendedLib = inputs.nixpkgs.lib.extend (self: super: import ./helper-functions.nix self);

      mkSystem =
        host: system:
        extendedLib.nixosSystem {
          system = system;
          specialArgs = {
            inherit inputs;
            my-pkgs = import ./packages {
              pkgs = inputs.nixpkgs.legacyPackages.${system};
              lib = extendedLib;
              inherit inputs;
            };

          };

          modules = [
            ./modules
            ./hosts/${host}
            ./hosts/${host}/hardware-configuration.nix

            inputs.home-manager.nixosModules.home-manager
          ];
        };

    in
    {
      nixosConfigurations =
        {
          pc = "x86_64-linux";
        }
        |> extendedLib.mapAttrs (host-name: mkSystem "${host-name}");
    };

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    nixvim.url = "github:nix-community/nixvim";
    import-tree.url = "github:denful/import-tree";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}

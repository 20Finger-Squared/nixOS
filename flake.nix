{
  description = "My conf";

  nixConfig.extra-experimetal-features = [
    "pipe-operators"
  ];

  outputs =
    { ... }@inputs:
    let
      lib = inputs.nixpkgs.lib;

      mkSystem =
        host: system:
        lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit inputs;
            mkConfig = import ./helper-functions.nix;
            # TODO get rid of extra arg
            my-pkgs = import ./packages {
              pkgs = inputs.nixpkgs.legacyPackages.${system};
              inherit inputs;
            };
          };

          # TODO convert to inport-tree
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
        |> lib.mapAttrs (host-name: mkSystem "${host-name}");
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

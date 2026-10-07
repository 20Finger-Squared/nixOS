{
  description = "My conf";
  inputs.nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
  inputs.home-manager = {
    url = "github:nix-community/home-manager/release-26.05";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      extendedLib = nixpkgs.lib.extend (self: super: import ./helper-functions.nix self);
      local_colourscheme = (import ./colourscheme.nix).gruvbox;

      mkSystem =
        hosts: system:
        extendedLib.nixosSystem {
          system = "${system}";
          specialArgs = {
            inherit inputs;
            colourscheme = local_colourscheme;
            my-pkgs = import ./packages {
              pkgs = nixpkgs.legacyPackages.${system};
              colourscheme = local_colourscheme;
              lib = extendedLib;
              inherit inputs;
            };
          };

          modules = [
            ./modules
            ./hosts/${hosts}
            ./hosts/${hosts}/hardware-configuration.nix
            ./home-manager
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                colourscheme = local_colourscheme;
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        pc = mkSystem "pc" "x86_64-linux";
      };
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
    };
}

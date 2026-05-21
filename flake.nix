{
  description = "My conf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      mkSystem =
        hosts: system:
        nixpkgs.lib.nixosSystem {
          system = "${system}";
          specialArgs = {
            inherit inputs;
            my-pkgs = import ./packages { pkgs = nixpkgs.legacyPackages.${system}; };
          };
          modules = [
            ./modules
            ./hosts/${hosts}
            ./hosts/${hosts}/hardware-configuration.nix
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

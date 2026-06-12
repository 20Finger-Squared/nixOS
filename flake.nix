{
  description = "My conf";
  inputs.nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";

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
        let
          extendedLib = nixpkgs.lib.extend (self: super: import ./helper-functions.nix self);
          local_colourscheme = (import ./colourscheme.nix).gruvbox;
        in
        extendedLib.nixosSystem {
          system = "${system}";
          specialArgs = {
            inherit inputs;
            colourscheme = local_colourscheme;
            my-pkgs = import ./packages {
              pkgs = nixpkgs.legacyPackages.${system};
              colourscheme = local_colourscheme;
            };
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

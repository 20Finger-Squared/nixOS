{
  description = "NixOS configuration for tf";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05"; # Correct channel for NixOS 25
    nixpkgs-24-11.url = "github:NixOS/nixpkgs/nixos-24.11";
    custom-packages = {
      flake = true;
      url = "path:packages/";
    };
    suckless-modules.url = "github:20Finger-Squared/suckless-nixos-modules";
  };

  outputs =
    {
      self,
      nixpkgs,
      suckless-modules,
      custom-packages,
      nixpkgs-24-11,
      ...
    }@inputs:
    let
      colorscheme-module = import ./modules/general/colorscheme-module.nix;
      colorscheme = colorscheme-module.gruvbox;
      mkSystem =
        hostname: system-type:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit colorscheme;
            nixpkgs-24-11 = nixpkgs-24-11.legacyPackages."${system-type}";
            my-pkgs = custom-packages.packages."${system-type}";
          };
          system = system-type;
          modules = [
            suckless-modules.nixosModules.default

            ./modules
            ./hosts/${hostname}
            ./hosts/${hostname}/hardware-configuration.nix
          ];
        };
      system = "x86_64-linux";
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

      nixosConfigurations.tf-pc = mkSystem "tf-pc" system;
      nixosConfigurations.laptop = mkSystem "laptop" system;
    };
}

{
  description = "NixOS configuration for tf";

  inputs = {
    nixpkgs-24-11.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05"; # Correct channel for NixOS 25
    custom-packages = {
      flake = true;
      url = "path:packages/";
    };
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-24-11,
      custom-packages,
      home-manager,
      ...
    }@inputs:
    let
      system-type = "x86_64-linux";
      mkSystem =
        hostname: system-type:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            nixpkgs-24-11 = nixpkgs-24-11.legacyPackages."${system-type}";
            my-pkgs = custom-packages.packages."${system-type}";
          };
          system = system-type;
          modules = [
            ./custom-modules/dwm/module.nix
            ./custom-modules/dmenu/module.nix
            ./custom-modules/general/colorscheme-module.nix
            ./custom-modules/st/module.nix

            ./modules/shared/default.nix
            ./modules/${hostname}/hardware-configuration.nix
            ./modules/${hostname}/default.nix

            ./home/default.nix
            home-manager.nixosModules.home-manager
          ];
        };
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

      nixosConfigurations.tf-laptop = mkSystem "tf-laptop" system-type;
      nixosConfigurations.tf-pc = mkSystem "tf-pc" system-type;
    };
}

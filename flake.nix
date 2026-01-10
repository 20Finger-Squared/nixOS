{
  description = "NixOS configuration for tf";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05"; # Correct channel for NixOS 25
    custom-packages = {
      flake = true;
      url = "path:packages/";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      custom-packages,
      ...
    }@inputs:
    let
      system-type = "x86_64-linux";
      colorscheme-module = import ./custom-modules/general/colorscheme-module.nix;
      colorscheme = colorscheme-module.gruvbox;
      mkSystem =
        hostname:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit colorscheme;
            my-pkgs = custom-packages.packages."${system-type}";
          };
          system = system-type;
          modules = [
            ./custom-modules/dwm/module.nix
            ./custom-modules/dmenu/module.nix
            ./custom-modules/st/module.nix

            ./modules/shared/default.nix
            ./modules/${hostname}/hardware-configuration.nix
            ./modules/${hostname}/default.nix
          ];
        };
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

      nixosConfigurations.tf-laptop = mkSystem "tf-laptop";
      nixosConfigurations.tf-pc = mkSystem "tf-pc";
    };
}

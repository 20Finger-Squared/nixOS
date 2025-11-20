{
  self,
  nixpkgs,
  nixpkgs-24-11,
  home-manager,
  ...
}@inputs:
let
  system-type = "x86_64-linux";
  mkSystem =
    hostname:
    nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs hostname;
        nixpkgs-24-11 = nixpkgs-24-11.legacyPackages."${system-type}";
      };
      system = system-type;
      modules = [
        ./${hostname}/hardware-configuration.nix
        ./${hostname}/nix-config/configuration.nix
        ./${hostname}/suckless/package.nix

        ./${hostname}/home/default.nix
        home-manager.nixosModules.home-manager

        self.nixosModules.colorscheme
      ];
    };
in
{
  formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
  nixosModules = {
    colorscheme = import ./colorscheme-module.nix;
  };

  nixosConfigurations.tf-laptop = mkSystem "tf-laptop";
  nixosConfigurations.tf-pc = mkSystem "tf-pc";
}

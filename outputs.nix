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
        inherit inputs;
        nixpkgs-24-11 = nixpkgs-24-11.legacyPackages."${system-type}";
      };
      system = system-type;
      modules = [
        ./custom-modules/dwm/module.nix
        ./custom-modules/colorscheme-module.nix

        ./modules/${hostname}/hardware-configuration.nix
        ./modules/${hostname}/configuration.nix

        ./suckless/package.nix

        ./home/default.nix
        home-manager.nixosModules.home-manager
      ];
    };
in
{
  formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

  nixosConfigurations.tf-laptop = mkSystem "tf-laptop";
  nixosConfigurations.tf-pc = mkSystem "tf-pc";
}

{
  self,
  nixpkgs,
  nixpkgs-24-11,
  home-manager,
  ...
}@inputs:
let
  system-type = "x86_64-linux";
in
{
  formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
  nixosModules = {
    colorscheme = import ./colorscheme-module.nix;
  };

  nixosConfigurations.tf-nixos = nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs;
      nixpkgs-24-11 = nixpkgs-24-11.legacyPackages."${system-type}";
    };

    system = system-type;
    modules = [
      ./nix-config/configuration.nix
      ./home/default.nix

      ./suckless/package.nix
      ./hardware-configuration.nix

      home-manager.nixosModules.home-manager
      self.nixosModules.colorscheme
    ];
  };
}

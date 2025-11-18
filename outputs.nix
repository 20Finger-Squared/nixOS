{
  self,
  nixpkgs,
  nixpkgs-24-11,
  home-manager,
  ...
}@inputs:
let
  dwl-desktop-file = "${self}/suckless/dwl/dwl.desktop";
  system-type = "x86_64-linux";
in
{
  formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

  nixosConfigurations.tf-nixos = nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit dwl-desktop-file;
      nixpkgs-24-11 = nixpkgs-24-11.legacyPackages."${system-type}";
    };

    system = system-type;
    modules = [
      ./nix-config/configuration.nix
      ./suckless/package.nix
      ./hardware-configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager = {
          extraSpecialArgs = {
            inherit nixpkgs-24-11;
            inherit inputs;
          };
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = ".bak";

          users.tf = {
            imports = [ ./home-files/home.nix ];
          };
        };
      }
    ];
  };
}

{
  self,
  nixpkgs,
  home-manager,
  ...
}@inputs:
let
  dwl-desktop-file = "${self}/suckless/dwl/dwl.desktop";
in
{
  formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

  nixosConfigurations.tf = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit dwl-desktop-file; };

    system = "x86_64-linux";
    modules = [
      ./nix-config/configuration.nix
      ./hardware-configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = ".bak";

          users.tf = {
            _module.args = { inherit inputs; };
            imports = [ ./home-files/home.nix ];
          };
        };
      }
    ];
  };
}

{ nixpkgs-24-11, inputs, ... }:
{
  home-manager = {
    extraSpecialArgs = {
      inherit nixpkgs-24-11;
      inherit inputs;
    };

    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = ".bak";

    sharedModules = [
      {
        programs.home-manager.enable = true;
        home.stateVersion = "25.05";
      }
    ];

    users.tf = {
      imports = [ ./tf/home.nix ];
    };
  };
}

{
  config,
  inputs,
  nixpkgs-24-11,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = {
      inherit nixpkgs-24-11;
      inherit inputs;
      colorscheme = config.colorscheme;
    };

    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";

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

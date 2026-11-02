{
  description = "My conf";

  nixConfig.extra-experimetal-features = [
    "pipe-operators"
  ];

  outputs =
    { ... }@inputs:
    let
      mkConfigOption = config-tag: config-name: inputs: attrset: {
        options.${config-tag}.${config-name} = inputs.lib.mkEnableOption "my ${config-name} config";
        config = inputs.lib.mkIf inputs.config.${config-tag}.${config-name} attrset;
      };

      mkConfig = {
        inherit mkConfigOption;

        system = mkConfigOption "system-config";
        software = mkConfigOption "software-config";
        programing-language = mkConfigOption "programing-language-config";
        desktop = mkConfigOption "desktop-config";
      };

      mkSystem =
        host: system:
        inputs.nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit inputs;
            inherit mkConfig;
          };

          modules = [
            (inputs.import-tree ./modules)

            ./hosts/${host}
            ./hosts/${host}/hardware-configuration.nix
            inputs.home-manager.nixosModules.home-manager
          ];
        };
    in
    {
      homeManagerModules.default = (inputs.import-tree ./home-manager-modules);

      nixosConfigurations =
        {
          pc = "x86_64-linux";
        }
        |> inputs.nixpkgs.lib.mapAttrs (host-name: mkSystem "${host-name}");
    };

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    nixvim.url = "github:nix-community/nixvim";
    import-tree.url = "github:denful/import-tree";
    home-manager = {
      url = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}

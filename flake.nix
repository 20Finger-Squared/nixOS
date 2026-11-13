{
  description = "My conf";

  nixConfig.extra-experimental-features = [
    "pipe-operators"
  ];

  outputs = inputs:
    let

    lib = inputs.nixpkgs.lib;

    # this can be ignored if you're not gonna look inside ./modules/inner-scope or ./modules/home-manager-modules as these are merely helper functions
    mkConfig =
    rec {
      /*
      This function is designed to be used alongside currying, which is why it has so many parameters rather than an attribute set.
      All it does is create a boolean option called `${config-tag}.${config-name}'
      It then sets `config` to the given attrset

      Using module-args.lib instead of the local lib was intentional
      I decided to use it instead of the local `lib` to avoid potential issues,
      if I decide to use another library ( For some reason ).
      */
      configOption = config-tag: config-name: module-args: attrset: {
        options.${config-tag}.${config-name} = module-args.lib.mkEnableOption "my ${config-name} config";
        config = module-args.lib.mkIf module-args.config.${config-tag}.${config-name} attrset;
      };

      system = configOption "system-config";
      software = configOption "software-config";
      desktop = configOption "desktop-config";
      home-option = configOption "home-manager-config";
    };

      /*
      This defines two options to be used in the outer-scope:
      `flake:
        Provides a namespace for setting flake outputs.
        i.e., it's basically just outputs

      nixos:
        An example is easier to understand.
        it's how you configure hosts.
        I prefer to err on the side of caution, so hardware and modules-config are separate.
        They could be the same, but keeping them separate serves as a useful reminder.
        ```nix
        nixos.* = {
          hardware = {...};
          modules-config = {...};
        };
        ```

      Look within
      ```sh
            ./modules/hosts/pc/hardware.nix
            ./modules/hosts/pc/default.nix
      ```
      to see full usage example. ( In Vim/Neovim, you can use `gf` to follow a file path )
      */
    nixosOptions = let types = lib.types; in{
      options = {
        nixos = lib.mkOption {
          type = types.attrsOf (types.submodule {
            options = {
              modules-config = lib.mkOption { type=types.deferredModule; };
              hardware = lib.mkOption { type=types.deferredModule; };
            };
          });
          default = {};
        };

        flake = lib.mkOption {
          type = types.lazyAttrsOf types.raw;
          default = {};
        };
      };
    };

    /*
      This sets the options within flake.
      It also processes the `nixos` option.
      So it creates all the hosts.
      Think of it as another name for outputs.
    */
    flake = {config,...}:{
      flake = {

          /*
          Importing modules meant for home-manager within regular nix will break the build.
          So i decided to seperate it into two directories ( ./modules/inner-scope and ./modules/home-manager-modules ).
          */
          home-manager-modules.default = inputs.import-tree ./modules/home-manager-modules;

          /*
           I decided to use qml files over nix.
           The reason for such is that quickshell doesn't have a way to configure it within nix.
          */
          quickshell-config.default = ./modules/quickshell-config;

          /*
            While initially complex it's easy to understand.
            `config.nixos` contains an attr set of
            ```nix
            {
              <host-name-1> = { modules-config = {...}; hardware = {...};};

              <host-name-2> = { modules-config = {...}; hardware = {...};};

              <host-name-3> = { modules-config = {...}; hardware = {...};};
            }```
            mapAttrs simply applies the function to that attrset.
            The `modules-config` and `hardware` values are passed to nixosSystem as modules.
            Like in a typical NixOS configuration.
           */
        nixosConfigurations =
        lib.mapAttrs
          (_: attr:
            # This means anything within modules within this is considered the inner-scope
            lib.nixosSystem {
              specialArgs = {
              inherit inputs mkConfig;
                  # merging the attrset prevents a niche recursion error if you use nixosConfigurations within the inner-scope.
                  flake = config.flake // {nixosConfigurations = lib.mkForce (throw "Usage of `flake.nixosConfigurations` within the inner-scope is strictly prohibited.");};
              };
              modules = [
                # here are the two attrs that are passed
                attr.hardware
                attr.modules-config

                (inputs.import-tree ./modules/inner-scope)
                inputs.home-manager.nixosModules.home-manager
              ];
            })
        config.nixos;
      };
    };

    evaluated_modules = lib.evalModules {
      specialArgs = { inherit inputs; };

      modules = [ (inputs.import-tree ./modules/hosts) nixosOptions flake ];
    };
    /*
       As explained earlier the reason we give the `evaluated_modules.config.flake` and not just `evaluated_modules` is because `evaluated_modules.config.flake` is equivalent to outputs.
       The rest (`nixos`) is merely just somewhere to put the hosts settings.
    */
    in evaluated_modules.config.flake;

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    nixvim.url = "github:nix-community/nixvim";
    hyprland-package.url = "github:hyprwm/Hyprland";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    import-tree.url = "github:denful/import-tree";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}

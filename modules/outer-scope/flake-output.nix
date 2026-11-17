    /*
      This sets the options within flake.
      It also processes the `nixos` option.
      So it creates all the hosts.
      Think of it as another name for outputs.
    */
    {config,inputs,lib,...}:
    {
      flake = {

          /*
           I decided to use qml files over nix.
           The reason for such is that quickshell doesn't have a way to configure it within nix.
          */
          quickshell-config.default = ../quickshell-config;

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
                inherit inputs;

                mkConfig = config.flake.mkConfig.default;

                # merging the attrset prevents a niche recursion error if you use nixosConfigurations within the inner-scope.
                flake = config.flake // {nixosConfigurations = throw "Usage of `flake.nixosConfigurations` within the inner-scope is strictly prohibited.";};
              };
              modules = [
                # here are the two attrs that are passed
                attr.hardware
                attr.modules-config

                (inputs.import-tree ../inner-scope)
                inputs.home-manager.nixosModules.home-manager
              ];
            })
        config.nixos;
      };
    }

{lib,...}:{
        flake.mkConfig.default =
      let
      options = {
        system = "system-config";
        software = "software-config";
        desktop = "desktop-config";
      };

      configOption = config-tag: config-name: module-args: attrset: {
        options.${config-tag}.${config-name} =
          module-args.lib.mkEnableOption "my ${config-name} config";

        config = module-args.lib.mkIf
          module-args.config.${config-tag}.${config-name}
          attrset;
      };

      homeConfigOption = config-tag: config-name: _module-args: module: {
        home-manager-modules = [
          (hm-args: {
            options.${config-tag}.${config-name} =
              hm-args.lib.mkEnableOption "my ${config-name} config";

            config = hm-args.lib.mkIf
              hm-args.config.${config-tag}.${config-name}
              (
                if builtins.isFunction module
                then module hm-args
                else module
              );
          })
        ];
      };

      makeOptions = f: lib.mapAttrs (_: value: f value) options;
    in
    {
      inherit configOption homeConfigOption;
      home = makeOptions homeConfigOption;
    } // makeOptions configOption;
}

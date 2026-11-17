{lib,...}:{
  /*
  This can be ignored if you're not gonna look inside ./modules/inner-scope or ./modules/outer-scope/home-manager-modules as these are merely helper functions
  This function is designed to be used alongside currying, which is why it has so many parameters rather than an attribute set.
  All it does is create a boolean option called `${config-tag}.${config-name}'
  It then sets `config` to the given attrset

  Using module-args.lib instead of the local lib was intentional
  I decided to use it instead of the local `lib` to avoid potential issues,
  if I decide to use another library ( For some reason ).
  */
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

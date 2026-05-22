lib: rec {
  mkConfigOption =
    config-tag: config-name:
    { config, lib, ... }:
    attrset: {
      options.${config-tag}.${config-name} = lib.mkEnableOption "my ${config-name} config";
      config = lib.mkIf config.${config-tag}.${config-name} attrset;
    };

  mkSystemOption = mkConfigOption "system-config";
  mkSoftwareOption = mkConfigOption "software-config";
  mkDesktopOption = mkConfigOption "desktop-config";
}

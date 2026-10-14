lib: rec {
  mkConfigOption = config-tag: config-name: inputs: attrset: {
    options.${config-tag}.${config-name} = lib.mkEnableOption "my ${config-name} config";
    config = lib.mkIf inputs.config.${config-tag}.${config-name} attrset;
  };
  mkSystemOption = mkConfigOption "system-config";
  mkSoftwareOption = mkConfigOption "software-config";
  mkProgramingLanguageOption = mkConfigOption "programing-language-config";
  mkDesktopOption = mkConfigOption "desktop-config";
}

let
  mkConfigOption = config-tag: config-name: inputs: attrset: {
    options.${config-tag}.${config-name} = inputs.lib.mkEnableOption "my ${config-name} config";
    config = inputs.lib.mkIf inputs.config.${config-tag}.${config-name} attrset;
  };
in
{
  mkSystemOption = mkConfigOption "system-config";
  mkSoftwareOption = mkConfigOption "software-config";
  mkProgramingLanguageOption = mkConfigOption "programing-language-config";
  mkDesktopOption = mkConfigOption "desktop-config";
}

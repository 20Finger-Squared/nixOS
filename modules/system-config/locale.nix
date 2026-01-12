{ lib, config, ... }:

let
  inherit (lib) mkIf mkEnableOption;
  locale = "en_GB.UTF-8";
in
{
  options.system-config.locale.enable = mkEnableOption "my locale and timezone config";
  config = mkIf config.system-config.locale.enable {
    time.timeZone = "Europe/London";
    i18n = {
      defaultLocale = locale;
      extraLocaleSettings = lib.genAttrs [
        "LC_ADDRESS"
        "LC_IDENTIFICATION"
        "LC_MEASUREMENT"
        "LC_MONETARY"
        "LC_NAME"
        "LC_NUMERIC"
        "LC_PAPER"
        "LC_TELEPHONE"
        "LC_TIME"
      ] (_: locale);
    };
  };
}

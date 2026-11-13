{
  colourscheme,
  lib,
  config,
  ...
}:
{
  options.home-manager-config.hyprtoolkit = lib.mkEnableOption "My home-manager hyprtoolkit config";
  config = lib.mkIf config.home-manager-config.hyprtoolkit {
    programs.hyprtoolkit = {
      enable = true;
      settings = {
        background = "0xFF${colourscheme.noHashtag.base00}";
        base = "0xFF${colourscheme.noHashtag.base02}";
        accent = "0xFF${colourscheme.noHashtag.base0A}";
      };
    };
  };
}

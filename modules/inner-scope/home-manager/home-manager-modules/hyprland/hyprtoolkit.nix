{ mkConfig,colourscheme, ... }@module-args:
mkConfig.home.software "hyprtoolkit" module-args {
    programs.hyprtoolkit = {
      enable = true;
      settings = {
        background = "0xFF${colourscheme.noHashtag.base00}";
        base = "0xFF${colourscheme.noHashtag.base02}";
        accent = "0xFF${colourscheme.noHashtag.base0A}";
      };
    };
}

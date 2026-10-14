{ mkScheme, ... }:
rec {
  _module.args.colourscheme = mkScheme scheme.gruvbox;

  scheme = {
    gruvbox = {
      description = "Color scheme configuration";
      scheme = "Gruvbox dark, hard";
      author = "Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)";
      base00 = "1d2021"; # black (background
      base01 = "3c3836"; # (Darkest Gray)
      base02 = "504945"; # (Dark Gray)
      base03 = "665c54"; # Bright Black ( Gray )
      base04 = "bdae93"; # (Light Gray)
      base05 = "d5c4a1"; # White
      base06 = "ebdbb2"; # (Lighter White)
      base07 = "fbf1c7"; # Bright White
      base08 = "fb4934"; # Red
      base09 = "fe8019"; # (Orange)
      base0A = "fabd2f"; # Yellow
      base0B = "b8bb26"; # Green
      base0C = "8ec07c"; # Cyan
      base0D = "83a598"; # Blue
      base0E = "d3869b"; # Magenta
      base0F = "d65d0e"; # Dark Red/Brown
      base10 = "2a2520"; # Darker Black
      base11 = "1d1d1d"; # Darkest Black
      base12 = "fb4934"; # Bright Red
      base13 = "fabd2f"; # Bright Yellow
      base14 = "b8bb26"; # Bright Green
      base15 = "8cc07c"; # Bright Cyan
      base16 = "83a598"; # Bright Bluw
      base17 = "d3859b"; # Bright Magenta
    };
  };
}

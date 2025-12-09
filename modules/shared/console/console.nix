{ pkgs, ... }:
{
  console = {
    keyMap = "us";
    earlySetup = true;
    font = "ter-16x";
    packages = [ pkgs.terminus_font ];

    colors = [
      # Gruvbox dark, hard
      # Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)
      # theme obtained from https://github.com/dawikur/base16-gruvbox-scheme/blob/master/gruvbox-dark-hard.yaml
      "1d2021"
      "3c3836"
      "504945"
      "665c54"
      "bdae93"
      "d5c4a1"
      "ebdbb2"
      "fbf1c7"
      "fb4934"
      "fe8019"
      "fabd2f"
      "b8bb26"
      "8ec07c"
      "83a598"
      "d3869b"
      "d65d0e"
    ];
  };
}

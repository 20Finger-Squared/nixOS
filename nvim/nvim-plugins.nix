{ pkgs, ... }:

with pkgs.vimPlugins; [
  telescope-nvim
  gitsigns-nvim
  blink-cmp
  gruvbox-nvim
]


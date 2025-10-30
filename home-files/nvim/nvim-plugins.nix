{ pkgs, ... }:

with pkgs.vimPlugins; [
  blink-cmp
  gitsigns-nvim
  gruvbox-nvim
  harpoon
  nvim-lspconfig
  markdown-nvim
  mini-nvim
  noice-nvim
  telescope-nvim
  pkgs.vimPlugins.nvim-treesitter.withAllGrammars
  luasnip
]


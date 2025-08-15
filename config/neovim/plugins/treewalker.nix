{ pkgs }:

{
  plugin = pkgs.vimPlugins.treewalker-nvim;
  type = "lua";
  config = ''
    require('treewalker').setup({
      highlight = false,
    })
  '';
}

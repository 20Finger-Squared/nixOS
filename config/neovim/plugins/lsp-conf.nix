{ pkgs }:
{
  plugin = pkgs.vimPlugins.nvim-lspconfig;
  type = "lua";
  config = ''
    local lspconfig = require("lspconfig")
    lspconfig.clangd.setup({})
  '';
}

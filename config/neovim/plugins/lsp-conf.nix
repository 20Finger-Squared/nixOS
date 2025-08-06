{ pkgs }:
{
    plugin = pkgs.nvim-lspconfig;
    type = "lua";
    config = ''
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({})
        end,
        '';
}


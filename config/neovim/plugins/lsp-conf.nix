{ pkgs }:
{
    plugin = pkgs.vimPlugins.nvim-lspconfig;
    type = "lua";
    config = /* lua */''
        local lspconfig = require("lspconfig")

        lspconfig.clangd.setup({})
        lspconfig.nil_ls.setup({})
        lspconfig.nixd.setup({
            settings = {
                nixd = {
                    formatting = { command = { "nixfmt" },
                    },
                },
            },
        })
    '';
}

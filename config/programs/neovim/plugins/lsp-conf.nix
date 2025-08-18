{ pkgs }:
{
  plugin = pkgs.vimPlugins.nvim-lspconfig;
  type = "lua";
  config = # lua
    ''
          local lspconfig = require("lspconfig")

          lspconfig.clangd.setup({})
          lspconfig.nil_ls.setup({
              settings = {
                  ['nil'] = {
                      formatting = { command = { "nixfmt" },
                      },
                  },
              },
          })
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = {'vim'} },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "2",
                    max_width = "80",
                }
            }
        },
    },
})


    '';
}

{ pkgs }:
{
  plugin = pkgs.vimPlugins.nvim-lspconfig;
  type = "lua";
  config = ''
    local lspconfig = require("lspconfig")
    
    lspconfig.clangd.setup({})
    
    -- Force set omnifunc for C files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {"c", "cpp"},
      callback = function()
        vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
        print("Omnifunc set for " .. vim.bo.filetype .. " file")
      end,
    })
    
    -- Also set it when LSP attaches (backup)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        print("LSP attached, omnifunc set")
      end,
    })
  '';
}

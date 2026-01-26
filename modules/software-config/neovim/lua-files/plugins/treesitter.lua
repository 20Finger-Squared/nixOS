require'nvim-treesitter'.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require("nvim-treesitter.config").setup({
  ensure_installed = "maintained",
          highlight = { enable = true },
          rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = 1000,
          },

})

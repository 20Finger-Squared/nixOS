
local mini_trailspace = require("mini.trailspace")
vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format()
    mini_trailspace.trim()
    mini_trailspace.trim_last_lines()
  end,
})   

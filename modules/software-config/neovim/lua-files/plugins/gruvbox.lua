require("gruvbox").setup({
    transparent_mode = true,
    dim_inactive = true,
    terminal_colors = true,
})

vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])
-- Apply the colorscheme after setup
vim.cmd("colorscheme gruvbox")

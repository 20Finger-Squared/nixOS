return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,    -- load immediately
    priority = 1000, -- make sure colorscheme loads first
    config = function()
        require("gruvbox").setup({
            transparent_mode = true,
            dim_inactive = true,
            terminal_colors = true,
        })

        vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])
        -- Apply the colorscheme after setup
        vim.cmd("colorscheme gruvbox")
    end
}

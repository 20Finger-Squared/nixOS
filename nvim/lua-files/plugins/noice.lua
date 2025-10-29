return {
    "folke/noice.nvim",
    event = "VeryLazy",
    cond = function()
        -- only load in standalone Neovim
        return not vim.g.vscode
    end,
    opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            },
        },
        -- you can enable a preset for easier configuration
        presets = {
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = true,            -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true,        -- add a border to hover docs and signature help
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
}

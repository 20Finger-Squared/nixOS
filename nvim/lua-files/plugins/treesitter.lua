return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = { "yuck" }, -- Add yuck here
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }

        -- Add parser for Yuck
        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.yuck = {
            install_info = {
                url = "https://github.com/elkowar/tree-sitter-yuck", -- parser repo
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "yuck",
        }
    end
}

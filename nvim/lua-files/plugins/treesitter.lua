-- Set writable parser directory BEFORE setup
local parser_install_dir = vim.fn.stdpath("data") .. "/treesitter"
vim.fn.mkdir(parser_install_dir, "p")
vim.opt.runtimepath:prepend(parser_install_dir)

require 'nvim-treesitter.configs'.setup {
    parser_install_dir = parser_install_dir,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- Add parser for Yuck
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.yuck = {
    install_info = {
        url = "https://github.com/elkowar/tree-sitter-yuck",
        files = { "src/parser.c" },
        branch = "main",
    },
    filetype = "yuck",
}

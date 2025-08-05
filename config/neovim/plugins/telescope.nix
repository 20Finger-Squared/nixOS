{ pkgs }:
{
    plugin = pkgs.vimPlugins.telescope-nvim;
    type = "lua";
    config = ''
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>to', builtin.vim_options, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        require("telescope").setup{}
    '';
}

{ pkgs }:

{
    plugin = pkgs.vimPlugins.gitsigns-nvim;
    type = "lua";
    config = ''
        require("gitsigns").setup({
                signs = {
                add          = { text = 'a' },
                change       = { text = 'c' },
                delete       = { text = 'd' },
                topdelete    = { text = 't' },
                changedelete = { text = 'r' },
                untracked    = { text = 'u' },
                },
                signs_staged = {
                add          = { text = 'A' },
                change       = { text = 'C' },
                delete       = { text = 'D' },
                topdelete    = { text = 'T' },
                changedelete = { text = 'R' },
                untracked    = { text = 'U' },
                },

                numhl = true,

                -- git blame opts
                    current_line_blame = true,
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                        delay = 0,
                    ignore_whitespace = false,
                    virt_text_priority = 100,
                    use_focus = true,
                },
                current_line_blame_formatter = "<summary> - <author> @ <author_mail> : <author_time:%R>",
        })
        vim.cmd([[highlight! link GitSignsCurrentLineBlame Comment]])
        '';
}

{ pkgs }:
{
    plugin = pkgs.vimPlugins.mini-nvim;
    type = "lua";
    config = # lua
        ''
        local plugins = {
            "ai",
            "align",
            "files",
            "surround",
        }

        for _, plugin in ipairs(plugins) do
            require("mini." .. plugin).setup()
        end

        require('mini.statusline').setup({
            use_icons = true,
            content = {
            active = function()
            local line = MiniStatusline
            local git         = line.section_git({ trunc_width = 75 })
            local diff        = line.section_diff({ trunc_width = 75 })
            local diagnostics = line.section_diagnostics({ trunc_width = 75 })
            local filename    = line.section_filename({ trunc_width = 140 })
            local time        = os.date("%H:%M")
            return MiniStatusline.combine_groups({
                    { hl = 'MiniStatuslineDevinfo', strings = {  git, diff, diagnostics } },
                    '%<', -- Mark general truncate point
                    { hl = 'MiniStatuslineFilename', strings = { filename } },
                    '%=',
                    { hl = 'MiniStatuslineFileinfo', strings = { time } },
                    })
            end,
            },
        })

        -- MiniFiles setup
        vim.keymap.set("n", "<leader>ow", MiniFiles.open, { desc = "Open MiniFiles" })
        '';
}

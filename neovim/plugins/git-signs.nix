{ pkgs }:
{
    plugin = pkgs.vimPlugins.mini-nvim;
    type = "lua";
    config = ''
        local plugins = {
            "ai",
            "align",
            "bracketed",
            "cursorword",
            "files",
            "trailspace",
            "surround",
        }

    for _, plugin in ipairs(plugins) do
        require("mini." .. plugin).setup()
            end

            require("mini.indentscope").setup({ symbol = '·' })

            require("mini.basics").setup({
                    options = {
                    win_borders = 'single',
                    },
                    mappings = {
                    windows = true,
                    move_with_alt = true,
                    }
                    }
                    )

            '';
}

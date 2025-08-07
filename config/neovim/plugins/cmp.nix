{ pkgs }:
{
    plugin = pkgs.vimPlugins.blink-cmp;
    type = "lua";
    config = ''
        'saghen/blink.cmp',
        dependencies = {
            "L3MON4D3/LuaSnip"
        },

        ---@module 'blink.cmp'
            ---@type blink.cmp.Config
            opts = {
                -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
                    -- 'super-tab' for mappings similar to vscode (tab to accept)
                    -- All presets have the following mappings:
                    -- C-space: Open menu or open docs if already open
                    -- C-n/C-p or Up/Down: Select next/previous item
                    -- C-e: Hide menu
                    -- C-k: Toggle signature help (if signature.enabled = true)

                    -- oneliners
                    cmdline    = { enabled           = true },
                appearance = { nerd_font_variant = 'mono' },
                sources    = { default           = { 'lsp', 'path', 'snippets', 'buffer' }, },
                snippets   = { preset            = 'luasnip'},

                fuzzy = {
                    sorts = {
                        "score",
                        "sort_text",
                        "label",
                    },
                    implementation = "prefer_rust_with_warning",
                },

                keymap = { preset = "default" },

                completion = {
                    ghost_text = { enabled = true },
                    documentation = { auto_show = true },

                    menu = {
                        auto_show = false,
                        draw = {
                            treesitter = { "lsp" },
                            columns = {
                                {"label", "label_description", gap=1 },
                                {"kind_icon", "kind"},
                                list = { selection = {
                                    preselect = true,
                                    auto_insert = true,
                                }},
                            }
                        }
                    }
                }
            },
        opts_extend = { "sources.default" }
    '';
}

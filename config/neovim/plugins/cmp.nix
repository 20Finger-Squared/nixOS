{ pkgs }:
{
    plugin = pkgs.vimPlugins.blink-cmp;
    type = "lua";
    config = ''
        require('blink.cmp').setup({
                -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
                -- 'super-tab' for mappings similar to vscode (tab to accept)
                -- All presets have the following mappings:
                -- C-space: Open menu or open docs if already open
                -- C-n/C-p or Up/Down: Select next/previous item
                -- C-e: Hide menu
                -- C-k: Toggle signature help (if signature.enabled = true)
                -- oneliners
                keymap = {
                preset = "none",
                ["<Tab>"] = { "select_and_accept", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
                ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<Left>"] = { "scroll_documentation_up", "fallback" },
                ["<Right>"] = { "scroll_documentation_down", "fallback" },
                },
                cmdline = { enabled = true },
                appearance = { nerd_font_variant = 'mono' },
                sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
                snippets = { preset = 'luasnip' },
                fuzzy = { sorts = {
                    "score",
                    "sort_text",
                    "label",
                },
                implementation = "prefer_rust_with_warning",
                },
                completion = {
                    ghost_text = { enabled = true },
                    documentation = {
                        auto_show = true,
                        auto_show_delay_ms = 0,
                    },
                    menu = {
                        auto_show = false,
                        draw = {
                            treesitter = { "lsp" },
                            columns = {
                                {"label", "label_description", gap = 1 },
                                {"kind_icon", "kind"},
                            },
                        },
                    },
                    list = {
                        selection = {
                            preselect = true,
                            auto_insert = true,
                        },
                    },
                },
        })
    '';
}

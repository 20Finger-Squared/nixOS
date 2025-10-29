return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets', 'L3MON4D3/LuaSnip' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    config = function()
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

                ["<C-k>"] = { "show", "select_prev", "fallback" },
                ["<C-j>"] = { "show", "select_next", "fallback" },
                ["<C-h>"] = { "show_documentation", "scroll_documentation_up", "fallback" },
                ["<C-l>"] = { "show_documentation", "scroll_documentation_down", "fallback" }
            },
            cmdline = { enabled = true },
            appearance = { nerd_font_variant = 'mono' },
            sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
            snippets = { preset = 'luasnip' },
            signature = { enabled = true },
            fuzzy = {
                sorts = {
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
                            { "label",     "label_description", gap = 1 },
                            { "kind_icon", "kind" },
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
    end
}

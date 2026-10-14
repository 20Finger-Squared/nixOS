require("blink.cmp").setup({
    keymap = {
        preset = "none",
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<Tab>"] = { "select_and_accept", "fallback" },
    },

    cmdline = { enabled = true },
    signature = { enabled = true },

    completion = {
        menu = { auto_show = false },
        ghost_text = { enabled = true },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 0,
        },
    },
})

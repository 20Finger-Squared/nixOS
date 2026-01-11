-- Detect VSCode Neovim
local is_vscode = vim.g.vscode

-- augroups
local qol = vim.api.nvim_create_augroup("qol", { clear = true })
local formatting = vim.api.nvim_create_augroup("formatting", { clear = true })

if not is_vscode then
    -- LSP folding override (VSCode handles folds itself)
    vim.api.nvim_create_autocmd("LspAttach", {
        group = qol,
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client:supports_method("textDocument/foldingRange") then
                local win = vim.api.nvim_get_current_win()
                vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
            end

            -- LSP document highlight support (VSCode already shows highlights)
            if client.server_capabilities.documentHighlightProvider then
                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    group = qol,
                    buffer = args.buf,
                    callback = vim.lsp.buf.document_highlight,
                })
                vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                    group = qol,
                    buffer = args.buf,
                    callback = vim.lsp.buf.clear_references,
                })
            end
        end,
    })

    -- Highlight on yank
    vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight when yanking (copying) text",
        group = qol,
        callback = function() vim.hl.on_yank() end,
    })

end

-- Shared (works in both VSCode and standalone Neovim)

-- Disable LSP for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "help", "man", "terminal", "alpha", "dashboard",
        "lspinfo", "mason", "null-ls-info", "checkhealth",
        "git", "gitcommit", "gitrebase", "packer", "lazy",
        "qf", "prompt", "scratch",
    },
    callback = function(args)
        local clients = vim.lsp.get_clients({ bufnr = args.buf })
        for _, client in ipairs(clients) do
            vim.lsp.buf_detach_client(args.buf, client.id)
        end
        vim.diagnostic.config({ virtual_text = false, signs = false, underline = false }, args.buf)
        vim.api.nvim_buf_set_var(args.buf, "lsp_disabled", true)
    end,
    desc = "Disable LSP for specific file types"
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = formatting,
    callback = function()
        vim.lsp.buf.format({ async = false, timeout_ms = 2000 })
    end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = formatting,
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        pcall(function() vim.cmd([[%s/\s\+$//e]]) end)
        vim.fn.setpos(".", save_cursor)
    end,
})

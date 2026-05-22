-- Ain't gonna lie this file is pretty much made only by AI
-- augroups
local qol = vim.api.nvim_create_augroup("qol", { clear = true })
local formatting = vim.api.nvim_create_augroup("formatting", { clear = true })

-- LSP folding override
vim.api.nvim_create_autocmd("LspAttach", {
  group = qol,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    -- Fold expression
    if client:supports_method("textDocument/foldingRange") then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end

    -- LSP document highlight
    if client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
        group = qol,
        buffer = args.buf,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {
        group = qol,
        buffer = args.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

-- Replace your old vim.hl.on_yank() with this:
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = qol,
  callback = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

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

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = formatting,
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        pcall(function() vim.cmd([[%s/\s\+$//e]]) end)
        vim.fn.setpos(".", save_cursor)
    end,
})

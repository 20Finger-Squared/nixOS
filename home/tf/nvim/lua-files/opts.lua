local opt = vim.opt

-- General
opt.wrap = false
opt.number = true

opt.relativenumber = true
opt.cursorline = true
opt.spell = true
opt.confirm = true
opt.winborder = "single"
opt.cmdheight = 0

-- Tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = false
opt.expandtab = true
opt.smartindent = true

-- Swap file
opt.swapfile = false

opt.termguicolors = true
opt.showmode = false
opt.laststatus = 3

-- Search
opt.smartcase = true
opt.incsearch = true
opt.inccommand = 'split'
opt.hlsearch = true

-- Backup & undo
opt.backup = false
opt.writebackup = false
opt.undofile = true

-- Scrolling & wrapping
opt.scrolloff = 4
opt.sidescrolloff = 4
opt.linebreak = true

-- Performance
opt.updatetime = 3000
opt.timeoutlen = 5000

-- folding with lsp/treesitter
opt.foldmethod = 'expr'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- These are the key settings you're missing:
opt.foldlevel = 99      -- Start with all folds open
opt.foldlevelstart = 99 -- Always start with all folds open
opt.foldenable = true   -- Enable folding
opt.foldcolumn = "auto"

vim.filetype.add({
    extension = {
        yuck = "yuck"
    }
})

local state = {
    floating = {
        buf = -1,
        win = -1,
    },
}

local function create_floating_window(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.9)
    local height = opts.height or math.floor(vim.o.lines * 0.9)

    -- Calculate the position to center the window
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    -- Create a buffer
    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
    end

    -- Define window configuration
    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal", -- Disables stuff like relative numbers
        border = "single",
    }

    -- Create the floating window
    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { buf = buf, win = win }
end

local toggle_terminal = function()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_floating_window({ buf = state.floating.buf })
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})

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
opt.tabstop = 2
opt.shiftwidth = 2
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

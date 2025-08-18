{ ... }:
/* lua */
''

local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General
opt.wrap = false
opt.lazyredraw = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.spell = true

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
opt.updatetime = 300
opt.timeoutlen = 500

opt.incommand = 'split'
opt.confirm = true

-- remove trailspace on write
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      pcall(function() vim.cmd [[%s/\s\+$//e]] end)
      vim.fn.setpos(".", save_cursor)
    end,
})

-- Highlight all words under the cursor
vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {
  callback = function()
    pcall(vim.fn.matchdelete, vim.w.cursorword_match or -1)
    local word = vim.fn.expand('<cword>')
    if word ~= "" then
      vim.w.cursorword_match = vim.fn.matchadd('CursorWord', [[\<]] .. word .. [[\>]])
    end
  end
})

-- highlight yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_set_hl(0, 'CursorWord', { underline = true })
''

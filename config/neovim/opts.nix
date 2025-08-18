{ ... }:
''
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General
vim.opt.wrap = false
vim.opt.lazyredraw = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.spell = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = false
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Swap file
vim.opt.swapfile = false

vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.laststatus = 3

-- Search
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Backup & undo
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true

-- Scrolling & wrapping
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4
vim.opt.linebreak = true

-- Performance
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

-- remove trailspace on write
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Highlight all works under the cursor
vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {
  callback = function()
    pcall(vim.fn.matchdelete, vim.w.cursorword_match or -1)
    local word = vim.fn.expand('<cword>')
    if word ~= "" then
      vim.w.cursorword_match = vim.fn.matchadd('CursorWord', [[\<]] .. word .. [[\>]])
    end
  end
})

vim.api.nvim_set_hl(0, 'CursorWord', { underline = true })
''

local map = vim.keymap.set

-- 󰩨 Resize windows
map({ 'n', 'i' }, '<M-C-H>', '<cmd>vertical resize -1<CR>', { silent = true, desc = "󰍟 Decrease width" })
map({ 'n', 'i' }, '<M-C-L>', '<cmd>vertical resize +1<CR>', { silent = true, desc = "󰍠 Increase width" })
map({ 'n', 'i' }, '<M-N-L>', '<cmd>resize -1<CR>', { silent = true, desc = "󰍡 Decrease height" })
map({ 'n', 'i' }, '<M-C-K>', '<cmd>resize +1<CR>', { silent = true, desc = "󰍡 Increase height" })

-- Fzf bindings
local fzf = require("fzf-lua")

-- buffer cmds
map("n", "<leader>fb",   fzf.buffers,    { desc = "󰋚 Recent files" })
map("n", "<leader>ff",   fzf.files,      { desc = "󰋚 Recent files" })
map("n", "<leader>fq",   fzf.quickfix,   { desc = "󰋚 Recent files" })
map("n", "<leader>fl",  fzf.lines,      { desc = "󰋚 Recent files" })
map("n", "<leader>fL", fzf.blines,     { desc = "󰋚 Recent files" })
map("n", "<leader>ft",  fzf.tabs,       { desc = "󰋚 Recent files" })

-- search
map("n", "<leader>fs",  fzf.live_grep_resume, { desc = "󰋚 Recent files" })
map("n", "<leader>fg",  fzf.live_grep_native, { desc = "󰋚 Recent files" })

-- Disable arrow keys
map({ 'n', 'i', 'v' }, '<Up>', '<Nop>', { desc = " Arrow keys disabled" })
map({ 'n', 'i', 'v' }, '<Down>', '<Nop>', { desc = " Arrow keys disabled" })
map({ 'n', 'i', 'v' }, '<Left>', '<Nop>', { desc = " Arrow keys disabled" })
map({ 'n', 'i', 'v' }, '<Right>', '<Nop>', { desc = " Arrow keys disabled" })

-- 󰜺 Move lines and code blocks
map("v", "<M-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "󰜷 Move selection up" })
map("v", "<M-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "󰜮 Move selection down" })
map("n", "<M-k>", ":m .-2<CR>==", { silent = true, desc = "󰜷 Move line up" })
map("n", "<M-j>", ":m .+1<CR>==", { silent = true, desc = "󰜮 Move line down" })

-- Format
vim.keymap.set('n', '<leader>fm', function()
  require('conform').format { async = true }
end)

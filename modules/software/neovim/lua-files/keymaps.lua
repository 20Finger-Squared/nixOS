local map = vim.keymap.set

-- 󰩨 Resize windows
map({ 'n', 'i' }, '<M-C-H>', '<cmd>vertical resize -1<CR>', { silent = true, desc = "󰍟 Decrease width" })
map({ 'n', 'i' }, '<M-C-L>', '<cmd>vertical resize +1<CR>', { silent = true, desc = "󰍠 Increase width" })
map({ 'n', 'i' }, '<M-N-L>', '<cmd>resize -1<CR>', { silent = true, desc = "󰍡 Decrease height" })
map({ 'n', 'i' }, '<M-C-K>', '<cmd>resize +1<CR>', { silent = true, desc = "󰍡 Increase height" })

-- Fzf bindings
local fzf = require("fzf-lua")

-- buffer cmds
map("n", "<leader>fb",   fzf.buffers,           { desc = "󰓩 Buffers" })
map("n", "<leader>ff",   fzf.files,             { desc = "󰈙 Find files" })
map("n", "<leader>fq",   fzf.quickfix,          { desc = "󰁨 Quickfix" })
map("n", "<leader>fl",   fzf.lines,             { desc = "󰸱 Lines (all)" })
map("n", "<leader>fL",   fzf.blines,            { desc = "󰸱 Lines (buffer)" })
map("n", "<leader>ft",   fzf.tabs,              { desc = "󰓩 Tabs" })
-- search
map("n", "<leader>fs",   fzf.live_grep_resume,  { desc = "󰍉 Resume search" })
map("n", "<leader>fg",   fzf.live_grep_native,  { desc = "󰍉 Live grep" })
map("n", "<leader>fr",   fzf.resume,            { desc = "󰑐 Resume" })

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
end, {silent = true, desc = "Format file."})

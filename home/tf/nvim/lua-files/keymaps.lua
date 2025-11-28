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

local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = " Add file to Harpoon" })
vim.keymap.set("n", "<leader>hq", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = " Toggle Harpoon menu" })

-- Jump to files 1-10
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = " Jump to file 1" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = " Jump to file 2" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = " Jump to file 3" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = " Jump to file 4" })
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = " Jump to file 5" })
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, { desc = " Jump to file 6" })
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end, { desc = " Jump to file 7" })
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end, { desc = " Jump to file 8" })
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end, { desc = " Jump to file 9" })
vim.keymap.set("n", "<leader>0", function() harpoon:list():select(10) end, { desc = " Jump to file 10" })

-- Terminal
map({ "n", "t" }, "<leader>t", ":Floaterminal<CR>", { desc = " Toggle floating terminal" })
map("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = " Exit terminal mode" })

{ ... }:
''
-- Move to windows
vim.keymap.set({ 'n', 'i' }, '<C-h>', '<C-w>h')
vim.keymap.set({ 'n', 'i' }, '<C-j>', '<C-w>j')
vim.keymap.set({ 'n', 'i' }, '<C-k>', '<C-w>k')
vim.keymap.set({ 'n', 'i' }, '<C-l>', '<C-w>l')

vim.keymap.set({ 'n', 'i', 'v' }, '<Up>', '<Nop>')
vim.keymap.set({ 'n', 'i', 'v' }, '<Down>', '<Nop>')
vim.keymap.set({ 'n', 'i', 'v' }, '<Left>', '<Nop>')
vim.keymap.set({ 'n', 'i', 'v' }, '<Right>', '<Nop>')
''

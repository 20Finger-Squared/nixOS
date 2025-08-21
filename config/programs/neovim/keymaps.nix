{ ... }:
# lua
''
  local set = vim.keymap.set

  -- Move to windows
  set({ 'n', 'i' }, '<C-h>', '<C-w>h')
  set({ 'n', 'i' }, '<C-j>', '<C-w>j')
  set({ 'n', 'i' }, '<C-k>', '<C-w>k')
  set({ 'n', 'i' }, '<C-l>', '<C-w>l')

      -- Resize windows
  set({'n', 'i'}, '<M-C-H>', '<cmd>vertical resize -1<CR>', { silent = true })
  set({'n', 'i'}, '<M-C-L>', '<cmd>vertical resize +1<CR>', { silent = true })
  set({'n', 'i'}, '<M-N-L>', '<cmd>resize -1<CR>', { silent = true })
  set({'n', 'i'}, '<M-C-K>', '<cmd>resize +1<CR>', { silent = true })

  set({ 'n', 'i', 'v' }, '<Up>', '<Nop>')
  set({ 'n', 'i', 'v' }, '<Down>', '<Nop>')
  set({ 'n', 'i', 'v' }, '<Left>', '<Nop>')
  set({ 'n', 'i', 'v' }, '<Right>', '<Nop>')

  -- terminal
  set({"n", "t"}, "<leader>t", ":Floaterminal<CR>", { desc = "Toggle floating terminal" })
  set("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = "Toggle floating terminal" })
''

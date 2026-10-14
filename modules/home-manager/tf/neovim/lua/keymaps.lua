local MiniPick = require("mini.pick")
local MiniFiles = require("mini.files")

-- mini pick
vim.keymap.set("n", "<leader>ff", MiniPick.builtin.files,     { desc="Open the files picker"  })
vim.keymap.set("n", "<leader>fg", MiniPick.builtin.grep_live, { desc="Open the grep picker"   })
vim.keymap.set("n", "<leader>fh", MiniPick.builtin.help,      { desc="Open the help picker"   })
vim.keymap.set("n", "<leader>fb", MiniPick.builtin.buffers,   { desc="Open the buffer picker" })
vim.keymap.set("n", "<leader>fr", MiniPick.builtin.resume,    { desc="Open the last picker"   })

-- mini files
vim.keymap.set("n", "<leader>ft", MiniFiles.open,             { desc="Open the file tree"     })

-- format
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format,         { desc="Format the buffer"      })

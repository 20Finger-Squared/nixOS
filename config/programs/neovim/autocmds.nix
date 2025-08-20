{ ... }:
# lua
''
  qol = vim.api.nvim_create_augroup('qol', { clear = true }),
  formatting = vim.api.nvim_create_augroup('formating', { clear = true }),

  -- Your LSP folding override
  vim.api.nvim_create_autocmd('LspAttach', {
      group = qol,
      callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client:supports_method('textDocument/foldingRange') then
              local win = vim.api.nvim_get_current_win()
              vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
          end
      end,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
      group = formatting
      callback = function()
          vim.lsp.buf.format({ async = false, timeout_ms = 2000, })
      end
  })

  -- remove trail-space on write
  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      group = formatting,
      callback = function()
          local save_cursor = vim.fn.getpos(".")
          pcall(function() vim.cmd [[%s/\s\+$//e]] end)
          vim.fn.setpos(".", save_cursor)
      end,
  })

  -- Highlight all words under the cursor
  vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {
      group = qol,
      callback = function()
          pcall(vim.fn.matchdelete, vim.w.cursorword_match or -1)
          local word = vim.fn.expand('<cword>')
          if word ~= "" then
              vim.w.cursorword_match = vim.fn.matchadd('CursorWord', [[\<]] .. word .. [[\>]])
          end
      end
  })

  -- Automatically set Neovim working directory to the git repo if one exists
  vim.api.nvim_create_autocmd("BufEnter", {
      group = qol,
      callback = function()
          local file_dir = vim.fn.expand("%:p:h")  -- directory of current buffer
          -- Try to get git root
          local git_root = vim.fn.systemlist("git -C " .. file_dir .. " rev-parse --show-toplevel 2>/dev/null")[1]
          if git_root and git_root ~= "" then
              -- Set tab-local directory to git root
              vim.cmd("tcd " .. git_root)
          end
      end,
  })

  -- highlight yanking
  vim.api.nvim_create_autocmd('TextYankPost', {
      desc = 'Highlight when yanking (copying) text',
      group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
      callback = vim.hl.on_yank
  })

  vim.api.nvim_set_hl(0, 'CursorWord', { underline = true })
''

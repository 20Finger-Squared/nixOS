{ ... }:
# lua
''
  -- augroups
  local qol = vim.api.nvim_create_augroup("qol", { clear = true })
  local formatting = vim.api.nvim_create_augroup("formatting", { clear = true })

  -- LSP folding override
  vim.api.nvim_create_autocmd("LspAttach", {
      group = qol,
      callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client:supports_method("textDocument/foldingRange") then
              local win = vim.api.nvim_get_current_win()
              vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
          end

          -- LSP document highlight support
          if client.server_capabilities.documentHighlightProvider then
              vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
                  group = qol,
                  buffer = args.buf,
                  callback = vim.lsp.buf.document_highlight,
              })
              vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {
                  group = qol,
                  buffer = args.buf,
                  callback = vim.lsp.buf.clear_references,
              })
          end
      end,
  })

  -- Format on save
  vim.api.nvim_create_autocmd("BufWritePre", {
      group = formatting,
      callback = function()
          vim.lsp.buf.format({ async = false, timeout_ms = 2000 })
      end,
  })

  -- Remove trailing whitespace on save
  vim.api.nvim_create_autocmd("BufWritePre", {
      group = formatting,
      callback = function()
          local save_cursor = vim.fn.getpos(".")
          pcall(function() vim.cmd([[%s/\s\+$//e]]) end)
          vim.fn.setpos(".", save_cursor)
      end,
  })

  -- Fallback: highlight word under cursor (if no LSP highlight available)
  vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {
      group = qol,
      callback = function()
          -- Only run if LSP highlighting didn’t set up for this buffer
          if not vim.b.lsp_highlight then
              pcall(vim.fn.matchdelete, vim.w.cursorword_match or -1)
              local word = vim.fn.expand("<cword>")
              if word ~= "" then
                  local safe = vim.fn.escape(word, [[\]])
                  vim.w.cursorword_match = vim.fn.matchadd("CursorWord", [[\V\<]] .. safe .. [[\>]])
              end
          end
      end,
  })

  -- Auto set working directory to git root
  vim.api.nvim_create_autocmd("BufEnter", {
      group = qol,
      callback = function()
          local file_dir = vim.fn.expand("%:p:h")
          local git_root = vim.fn.systemlist("git -C " .. file_dir .. " rev-parse --show-toplevel 2>/dev/null")[1]
          if git_root and git_root ~= "" then
              vim.cmd("tcd " .. git_root)
          end
      end,
  })

  -- Highlight on yank
  vim.api.nvim_create_autocmd("TextYankPost", {
      desc = "Highlight when yanking (copying) text",
      group = qol,
      callback = vim.hl.on_yank,
  })

  -- Highlight style for cursorword
  vim.api.nvim_set_hl(0, "CursorWord", { underline = true })
''

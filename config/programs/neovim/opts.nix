{ ... }:
# lua
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
  opt.inccommand = 'split'
  opt.confirm = true
  opt.winborder = "rounded"

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
  opt.updatetime = 3000
  opt.timeoutlen = 5000

  -- lsp configs
  vim.lsp.inlay_hint.enable(true)

    -- folding with lsp/treesitter
    opt.foldmethod = 'expr'
    opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

    -- These are the key settings you're missing:
    opt.foldlevel = 99        -- Start with all folds open
    opt.foldlevelstart = 1   -- Always start with all folds open
    opt.foldenable = true     -- Enable folding
    opt.foldcolumn = "auto"
    opt.foldclose = "all"
    -- Optional: smoother folding
    opt.foldminlines = 1      -- Allow folding single lines

    -- Your LSP folding override
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client:supports_method('textDocument/foldingRange') then
              local win = vim.api.nvim_get_current_win()
              vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
            end
        end,
    })

  vim.api.nvim_create_autocmd("BufWritePre", {
          callback = function()
          vim.lsp.buf.format({
                  async = false,
                  timeout_ms = 2000,
                  })
          end,
          })

  -- remove trailspece on write
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

  vim.api.nvim_create_autocmd("BufEnter", {
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
          callback = function()
          vim.hl.on_yank()
          end,
          })

  vim.api.nvim_set_hl(0, 'CursorWord', { underline = true })


''

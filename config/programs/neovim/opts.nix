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



  local state = {
  floating = {
      buf = -1,
      win = -1,
  },
  }

  local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  -- Calculate the position to center the window
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Create a buffer
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
      buf = opts.buf
  else
      buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
  end

  -- Define window configuration
  local win_config = {
      relative = "editor",
      width = width,
      height = height,
      col = col,
      row = row,
      style = "minimal", -- No borders or extra UI elements
      border = "rounded",
  }

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
  end

  local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
      state.floating = create_floating_window({ buf = state.floating.buf })
      if vim.bo[state.floating.buf].buftype ~= "terminal" then
          vim.cmd.terminal()
      end
  else
      vim.api.nvim_win_hide(state.floating.win)
  end
  end

  vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})

''

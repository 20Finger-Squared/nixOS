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

  -- highlight yanking
  vim.api.nvim_create_autocmd('TextYankPost', {
          desc = 'Highlight when yanking (copying) text',
          group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
          callback = function()
          vim.hl.on_yank()
          end,
          })

  vim.api.nvim_set_hl(0, 'CursorWord', { underline = true })

  -- Diagnostic Config
  -- See :help vim.diagnostic.Opts
  vim.diagnostic.config {
      severity_sort = true,
                    float = { border = 'rounded', source = 'if_many' },
                    underline = { severity = vim.diagnostic.severity.ERROR },
                    signs = vim.g.have_nerd_font and {
                        text = {
                            [vim.diagnostic.severity.ERROR] = '󰅚 ',
                            [vim.diagnostic.severity.WARN] = '󰀪 ',
                            [vim.diagnostic.severity.INFO] = '󰋽 ',
                            [vim.diagnostic.severity.HINT] = '󰌶 ',
                        },
                    } or {},
                    virtual_text = {
                        source = 'if_many',
                        spacing = 2,
                        format = function(diagnostic)
                            local diagnostic_message = {
                                [vim.diagnostic.severity.ERROR] = diagnostic.message,
                                [vim.diagnostic.severity.WARN] = diagnostic.message,
                                [vim.diagnostic.severity.INFO] = diagnostic.message,
                                [vim.diagnostic.severity.HINT] = diagnostic.message,
                            }
                        return diagnostic_message[diagnostic.severity]
                            end,
                    },
  }


''

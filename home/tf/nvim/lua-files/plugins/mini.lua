local MiniStatusline = require('mini.statusline')
require("mini.surround").setup()
require("mini.align").setup()
require("mini.ai").setup()
require("mini.comment").setup()

local miniclue = require('mini.clue')
miniclue.setup({
triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- `[` and `]` keys
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
},

clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    -- miniclue.gen_clues.square_brackets(),
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
},
-- Clue window settings
window = {
    -- Floating window config
    config = { anchor = "SE", row = "auto", col = "auto" },

    -- Delay before showing clue window
    delay = 0,
},
})
-- MiniStatusline setup
MiniStatusline.setup({
content = {
    active = function()
	local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
	local git           = MiniStatusline.section_git({ trunc_width = 40 })
	local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
	local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
	local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
	local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
	local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
	local location      = MiniStatusline.section_location({ trunc_width = 75 })
	local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

    local function section_recording()
      local rec = vim.fn.reg_recording()
      if rec == '' then return '' end
      return 'Recording @' .. rec
    end

	-- Custom highlight
	vim.api.nvim_set_hl(0, "MiniStatusLineMacro", {
	    link = "GruvboxOrange",
	    bg = "#a89984",
	    bold = true,
	})

	return MiniStatusline.combine_groups({
	    -- Left side: Git / Diff / Diagnostics / LSP
	    { hl = 'MiniStatuslineDevinfo',      strings = { git,    diff, diagnostics, lsp } },
	    '%<',                                -- truncate point
	    -- Center: filename
	    { hl = 'MiniStatuslineFilename',     strings = { filename } },
	    '%=',                                -- end left alignment
        { hl = 'MiniStatusLineMacro',        strings = { section_recording() } },
	    { hl = 'MiniStatuslineFileinfo',     strings = { fileinfo } },
	    { hl = mode_hl,                      strings = { search, location } },
	})
    end,


    inactive = function()
	local filename = MiniStatusline.section_filename({ trunc_width = 140 })
	local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })

	return MiniStatusline.combine_groups({
	    -- Left side: filename
	    { hl = 'MiniStatuslineInactive', strings = { filename } },
	    '%=', -- end left alignment
	    -- Right side: file info
	    { hl = 'MiniStatuslineInactive', strings = { fileinfo } },
	})
    end,
},
})

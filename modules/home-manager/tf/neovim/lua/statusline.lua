vim.o.cmdheight = 0

local colour = {
  fg1 = "#FBF1C7",
  fg = "#A89984",
  blue = "#458588",
  light_blue = "#83A598",
  red = "#CC241D",
  purple = "#B16286",
  orange = "#FE8019",
  bg2 = "#504945",
}

local bar_normal = colour.bg2

function _G.statusline_mode()
  return vim.api.nvim_get_mode().mode:upper()
end

function _G.statusline_get_mode_update_highlights()
  local mode = _G.statusline_mode()
  local banner_bg_col = colour.blue

  if mode == "N" then
    banner_bg_col = colour.fg
  elseif mode == "I" then
    banner_bg_col = colour.purple
  elseif mode == "R" then
    banner_bg_col = colour.red
  elseif mode == "C" then
    banner_bg_col = colour.orange
  elseif mode == "V" then
    banner_bg_col = colour.blue
  end

  vim.api.nvim_set_hl(0, "mode_colours", {
    fg = colour.fg1,
    bg = banner_bg_col,
  })

  vim.api.nvim_set_hl(0, "mode_sep_colours", {
    fg = banner_bg_col,
    bg = bar_normal,
  })

  return mode
end

function highlight_text(text, group)
  return "%#" .. group .. "#" .. text .. "%*"
end

-- Replaced undefined banner_bg_col references with bar_normal
vim.api.nvim_set_hl(0, "file_colours", {
  fg = colour.fg1,
  bg = colour.blue,
})

vim.api.nvim_set_hl(0, "file_sep_colours", {
  bg = bar_normal,
  fg = colour.blue,
})

vim.api.nvim_set_hl(0, "file_info_colours", {
  fg = colour.fg1,
  bg = colour.light_blue,
})

vim.api.nvim_set_hl(0, "file_info_left_sep_colours", {
  bg = colour.blue,
  fg = colour.light_blue,
})

vim.api.nvim_set_hl(0, "file_info_sep_colours", {
  bg = bar_normal,
  fg = colour.light_blue,
})

vim.api.nvim_set_hl(0, "recording_colours", {
  bg = bar_normal,
  fg = colour.orange,
})

local cmdline_group = vim.api.nvim_create_augroup("StatuslineCmdline", { clear = true })

-- Fixed missing closing parenthesis `)` below
vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineChanged", "CmdlineLeave" }, {
  group = cmdline_group,
  callback = function()
    vim.cmd("redrawstatus")
  end,
})

-- Helper function to retrieve active command input
function _G.get_active_cmdline()
  if vim.fn.mode() == "c" then
    return vim.fn.getcmdtype() .. " " .. vim.fn.getcmdline()
  end
  return ""
end

function _G.statusline_recording()
  local reg = vim.fn.reg_recording()
  if reg == "" then
    return ""
  end

  return "@" .. reg
end

local mode = "%{v:lua.statusline_get_mode_update_highlights()}"
local recording = "%{%v:lua.statusline_recording()%}"
local filepath = "%F%m %r"
local fileinfo = "%{&filetype}"
local cursor_percentage = " %2p%%"
local cursor_location = " %3l:%-2c "

-- just to make sure the bars colours initialises correctly
statusline_get_mode_update_highlights()

vim.o.statusline = table.concat({
  " ",
  highlight_text("", "mode_sep_colours"),
  highlight_text(" " .. mode .. " ", "mode_colours"),
  highlight_text("", "mode_sep_colours"),
  highlight_text(" " .. recording, "recording_colours"),
  "%=",

  highlight_text("", "file_sep_colours"),
  highlight_text(" " .. filepath .. " ", "file_colours"),
  highlight_text("", "file_info_left_sep_colours"),
  highlight_text(" " .. fileinfo .. " ", "file_info_colours"),
  highlight_text("", "file_info_sep_colours"),

  cursor_percentage,
  cursor_location,
})

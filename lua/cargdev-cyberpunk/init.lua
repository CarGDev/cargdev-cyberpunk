---@class CargdevCyberpunk
---@field config CargdevCyberpunkConfig
---@field colors CargdevCyberpunkPalette
local colors = require("cargdev-cyberpunk.colors")
local c = colors.palette
local api = vim.api
local g = vim.g
local o = vim.o
local opt_local = vim.opt_local
local cmd = vim.cmd
local fn = vim.fn

local M = {}

function M.setup()
  local augroup = api.nvim_create_augroup("CargdevCyberpunk", { clear = true })
  api.nvim_create_autocmd("ColorScheme", {
    group = augroup,
    pattern = "*",
    callback = function()
      if vim.g.colors_name == "cargdev-cyberpunk" then
        M.apply_highlights()
        M.apply_terminal_colors()
      end
    end,
  })
end

function M.load()
  if vim.g.colors_name then
    cmd("hi clear")
  end

  cmd("syntax reset")
  vim.opt.termguicolors = true
  vim.g.colors_name = "cargdev-cyberpunk"

  M.apply_highlights()
  M.apply_terminal_colors()

  if M.setup_file_explorer_bg then
    M.setup_file_explorer_bg()
  end
end
---Setup the colorscheme with options
---@param opts? CargdevCyberpunkConfig
function M.setup(opts)
  local config = require("cargdev-cyberpunk.config")
  config.setup(opts)

  -- Apply custom color overrides if provided
  if opts and opts.colors and next(opts.colors) then
    local colors = require("cargdev-cyberpunk.colors")
    colors.override(opts.colors)
  end

  M.load()
end

---Apply all highlight groups
function M.apply_highlights()
  local colors = require("cargdev-cyberpunk.colors")
  local config = require("cargdev-cyberpunk.config")
  local highlights = require("cargdev-cyberpunk.highlights")

  local groups = highlights.get_groups(colors.palette, config.get())

  for group, settings in pairs(groups) do
    api.nvim_set_hl(0, group, settings)
  end
end

---Apply terminal colors
function M.apply_terminal_colors()
  local config = require("cargdev-cyberpunk.config")

  if not config.get().terminal_colors then
    return
  end

  g.terminal_color_0 = c.black
  g.terminal_color_1 = c.red
  g.terminal_color_2 = c.green
  g.terminal_color_3 = c.yellow
  g.terminal_color_4 = c.blue
  g.terminal_color_5 = c.magenta
  g.terminal_color_6 = c.cyan
  g.terminal_color_7 = c.white
  g.terminal_color_8 = c.bright_black
  g.terminal_color_9 = c.bright_red
  g.terminal_color_10 = c.bright_green
  g.terminal_color_11 = c.bright_yellow
  g.terminal_color_12 = c.bright_blue
  g.terminal_color_13 = c.bright_magenta
  g.terminal_color_14 = c.bright_cyan
  g.terminal_color_15 = c.bright_white
end

---Setup background colors for file explorers (NERDTree, etc.)
function M.setup_file_explorer_bg()
  -- Create highlight groups for NERDTree background
  api.nvim_set_hl(0, "NERDTreeNormal", { fg = c.fg.secondary, bg = c.bg.secondary })
  api.nvim_set_hl(0, "NERDTreeEndOfBuffer", { fg = c.fg.secondary, bg = c.bg.secondary })
  api.nvim_set_hl(0, "NERDTreeWinSeparator", { fg = c.fg.secondary, bg = c.bg.secondary })

  -- Set up autocmd for NERDTree windows
  local augroup = api.nvim_create_augroup("CargdevCyberpunkNERDTree", { clear = true })

  api.nvim_create_autocmd("FileType", {
    group = augroup,
    pattern = "nerdtree",
    callback = function()
      opt_local.winhighlight = "Normal:NERDTreeNormal,EndOfBuffer:NERDTreeEndOfBuffer,WinSeparator:NERDTreeWinSeparator"
    end,
  })
end

---Get the color palette
---@return CargdevCyberpunkPalette
function M.get_colors()
  return require("cargdev-cyberpunk.colors").get_palette()
end

return M

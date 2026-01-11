---@class CargdevCyberpunk
---@field config CargdevCyberpunkConfig
---@field colors CargdevCyberpunkPalette
local M = {}

---Load the colorscheme
function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "cargdev-cyberpunk"

  M.apply_highlights()
  M.apply_terminal_colors()
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
    vim.api.nvim_set_hl(0, group, settings)
  end
end

---Apply terminal colors
function M.apply_terminal_colors()
  local config = require("cargdev-cyberpunk.config")

  if not config.get().terminal_colors then
    return
  end

  local colors = require("cargdev-cyberpunk.colors")
  local c = colors.palette.terminal

  vim.g.terminal_color_0 = c.black
  vim.g.terminal_color_1 = c.red
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.yellow
  vim.g.terminal_color_4 = c.blue
  vim.g.terminal_color_5 = c.magenta
  vim.g.terminal_color_6 = c.cyan
  vim.g.terminal_color_7 = c.white
  vim.g.terminal_color_8 = c.bright_black
  vim.g.terminal_color_9 = c.bright_red
  vim.g.terminal_color_10 = c.bright_green
  vim.g.terminal_color_11 = c.bright_yellow
  vim.g.terminal_color_12 = c.bright_blue
  vim.g.terminal_color_13 = c.bright_magenta
  vim.g.terminal_color_14 = c.bright_cyan
  vim.g.terminal_color_15 = c.bright_white
end

---Get the color palette
---@return CargdevCyberpunkPalette
function M.get_colors()
  return require("cargdev-cyberpunk.colors").get_palette()
end

return M

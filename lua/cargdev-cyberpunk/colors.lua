---@class CargdevCyberpunkPalette
---@field bg table Background colors
---@field fg table Foreground colors
---@field syntax table Syntax highlighting colors
---@field special table Special/diagnostic colors

local M = {}

---@type CargdevCyberpunkPalette
M.palette = {
  bg = {
    primary = "#002B36",
    secondary = "#003B46",
    tertiary = "#004B56",
    float = "#003B46",
    highlight = "#112233",
    selection = "#44475A",
  },

  fg = {
    primary = "#E0E0E0",
    secondary = "#B8B8B8",
    muted = "#888888",
    accent = "#8BE9FD",
  },

  syntax = {
    keyword = "#FF79C6",
    ["function"] = "#50FA7B",
    string = "#FFFFFF",
    number = "#FFB86C",
    comment = "#666666",
    type = "#BD93F9",
    constant = "#FFB86C",
    operator = "#FF79C6",
    variable = "#BD93F9",
    property = "#50FA7B",
  },

  special = {
    error = "#FF5555",
    warning = "#FFB86C",
    info = "#8BE9FD",
    hint = "#50FA7B",
    success = "#50FA7B",
    diff_add = "#50FA7B",
    diff_delete = "#FF5555",
    diff_change = "#FFB86C",
  },

  -- Terminal colors (for :terminal)
  terminal = {
    black = "#002B36",
    red = "#FF5555",
    green = "#50FA7B",
    yellow = "#FFB86C",
    blue = "#BD93F9",
    magenta = "#FF79C6",
    cyan = "#8BE9FD",
    white = "#E0E0E0",
    bright_black = "#44475A",
    bright_red = "#FF6E67",
    bright_green = "#5AF78E",
    bright_yellow = "#F4F99D",
    bright_blue = "#CAA9FA",
    bright_magenta = "#FF92DF",
    bright_cyan = "#9AEDFE",
    bright_white = "#F8F8F2",
  },
}

---Override palette colors with custom values
---@param custom_colors table Partial palette override
function M.override(custom_colors)
  for category, values in pairs(custom_colors) do
    if M.palette[category] then
      for key, value in pairs(values) do
        M.palette[category][key] = value
      end
    end
  end
end

---Get a copy of the current palette
---@return CargdevCyberpunkPalette
function M.get_palette()
  return vim.deepcopy(M.palette)
end

return M

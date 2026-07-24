---@class CargdevCyberpunkPalette
---@field bg table Background colors
---@field fg table Foreground colors
---@field syntax table Syntax highlighting colors
---@field special table Special/diagnostic colors

local M = {}

---@type CargdevCyberpunkPalette
M.palette = require("cargdev-cyberpunk.pallete").vibrant

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

---@class CargdevCyberpunkConfig
---@field transparent boolean Enable transparent background
---@field italic_comments boolean Use italic style for comments
---@field bold_keywords boolean Use bold style for keywords
---@field bold_functions boolean Use bold style for functions
---@field bold_types boolean Use bold style for types
---@field terminal_colors boolean Set terminal colors
---@field colors table Custom color overrides

local M = {}

---@type CargdevCyberpunkConfig
M.defaults = {
  transparent = false,
  italic_comments = true,
  bold_keywords = true,
  bold_functions = true,
  bold_types = true,
  terminal_colors = true,
  colors = {},
}

---@type CargdevCyberpunkConfig
M.options = {}

---Setup configuration
---@param opts? CargdevCyberpunkConfig
function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
end

---Get current configuration
---@return CargdevCyberpunkConfig
function M.get()
  return M.options
end

return M

---@class CargdevCyberpunkPlugin
local M = {}

M.name = "cargdev-cyberpunk.nvim"
M.description = "A vibrant Neovim color scheme with cyberpunk aesthetics"
M.version = "1.1.1"
M.author = "CargDev"
M.license = "MIT"
M.repository = "https://github.com/yourusername/cargdev-cyberpunk.nvim"

---Plugin configuration for lazy.nvim
---@param opts? CargdevCyberpunkConfig
function M.config(opts)
  require("cargdev-cyberpunk").setup(opts)
end

return M

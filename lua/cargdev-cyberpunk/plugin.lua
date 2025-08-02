local M = {}

M.name = "cargdev-cyberpunk.nvim"
M.description = "A vibrant Neovim color scheme with cyberpunk aesthetics"
M.version = "1.0.0"
M.author = "CargDev"
M.license = "MIT"

function M.config()
  require('cargdev-cyberpunk').setup()
end

return M 
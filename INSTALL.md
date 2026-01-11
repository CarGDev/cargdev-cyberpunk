# Installation Guide

This guide will help you install and configure the CargDev-Cyberpunk.nvim color scheme.

## Prerequisites

- Neovim 0.8.0 or higher
- A plugin manager (Lazy.nvim, Packer, vim-plug, etc.)
- `termguicolors` support (automatically enabled by the plugin)

## Quick Installation

### Using Lazy.nvim (Recommended)

Add this to your Neovim configuration:

```lua
-- In your plugins.lua or init.lua
{
  "yourusername/cargdev-cyberpunk.nvim",
  lazy = false,      -- Load during startup
  priority = 1000,   -- Load before other plugins
  config = function()
    require("cargdev-cyberpunk").setup()
  end,
}
```

### Using Packer

```lua
use {
  "yourusername/cargdev-cyberpunk.nvim",
  config = function()
    require("cargdev-cyberpunk").setup()
  end
}
```

### Using vim-plug

```vim
" In your .vimrc or init.vim
Plug 'yourusername/cargdev-cyberpunk.nvim'
```

Then in your Neovim Lua configuration:

```lua
require("cargdev-cyberpunk").setup()
```

## Manual Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/cargdev-cyberpunk.nvim \
  ~/.local/share/nvim/site/pack/plugins/start/cargdev-cyberpunk.nvim
```

2. Add to your Neovim configuration:

```lua
require("cargdev-cyberpunk").setup()
```

## Using Colorscheme Command

After installation, you can also load the colorscheme with the standard command:

```vim
:colorscheme cargdev-cyberpunk
```

This is useful if you want to switch colorschemes dynamically.

## Configuration

### Basic Configuration

```lua
require("cargdev-cyberpunk").setup()
```

### Advanced Configuration

```lua
require("cargdev-cyberpunk").setup({
  -- Enable transparent background (useful for terminal transparency)
  transparent = false,

  -- Typography styles
  italic_comments = true,   -- Italicize comments
  bold_keywords = true,     -- Bold keywords (if, for, function, etc.)
  bold_functions = true,    -- Bold function names
  bold_types = true,        -- Bold type names

  -- Terminal integration
  terminal_colors = true,   -- Set colors for :terminal

  -- Custom color overrides
  colors = {
    bg = {
      primary = "#000000",    -- Pure black background
    },
    syntax = {
      keyword = "#FF00FF",    -- Custom keyword color
    },
  },
})
```

### Transparent Background

If you use a terminal with transparency, enable the transparent option:

```lua
require("cargdev-cyberpunk").setup({
  transparent = true,
})
```

### Customizing Colors

Override any color in the palette:

```lua
require("cargdev-cyberpunk").setup({
  colors = {
    -- Background colors
    bg = {
      primary = "#1a1a2e",
      secondary = "#16213e",
    },
    -- Foreground colors
    fg = {
      primary = "#ffffff",
      accent = "#00ffff",
    },
    -- Syntax colors
    syntax = {
      keyword = "#ff6b6b",
      ["function"] = "#4ecdc4",
      string = "#ffe66d",
    },
    -- Diagnostic colors
    special = {
      error = "#ff4757",
      warning = "#ffa502",
    },
  },
})
```

## Verification

To verify the installation:

1. Open Neovim
2. Check that colors are applied: `:hi Normal`
3. Open a TypeScript file (like `examples/sample.ts`)
4. Verify syntax highlighting is working

### Run Tests

You can run the test suite to verify everything works:

```bash
nvim --headless -c "lua dofile('test/test_colors.lua')"
```

Or from within Neovim:

```vim
:lua dofile('test/test_colors.lua')
```

## Troubleshooting

### Colors not appearing correctly

1. Ensure `termguicolors` is supported by your terminal
2. Check that the plugin is loaded: `:lua print(vim.inspect(package.loaded['cargdev-cyberpunk']))`
3. Try reloading: `:lua require('cargdev-cyberpunk').load()`

### Plugin not found

1. Verify the plugin is installed in the correct directory
2. Run `:checkhealth` to diagnose issues
3. Restart Neovim after installation

### Treesitter highlights not working

1. Ensure Treesitter is installed: `:TSInstallInfo`
2. Install parsers: `:TSInstall typescript tsx`
3. Restart Neovim

### LSP semantic tokens not working

1. Ensure your LSP supports semantic tokens
2. Check LSP status: `:LspInfo`
3. Verify LSP is attached: `:lua print(vim.inspect(vim.lsp.get_active_clients()))`

### Terminal colors look wrong

1. Verify `terminal_colors` is enabled in config
2. Open a new terminal buffer: `:terminal`
3. Check terminal colors are set: `:lua print(vim.g.terminal_color_0)`

## Updating

### With Lazy.nvim

```vim
:Lazy update cargdev-cyberpunk.nvim
```

### With Packer

```vim
:PackerUpdate cargdev-cyberpunk.nvim
```

### Manual

```bash
cd ~/.local/share/nvim/site/pack/plugins/start/cargdev-cyberpunk.nvim
git pull
```

## Uninstallation

To remove the color scheme:

1. Remove the plugin from your plugin manager configuration
2. Remove any setup calls from your Neovim config
3. Run your plugin manager's clean/sync command
4. Restart Neovim

## Support

If you encounter issues:

1. Check the [Issues](https://github.com/yourusername/cargdev-cyberpunk.nvim/issues) page
2. Create a new issue with:
   - Your Neovim version (`:version`)
   - Plugin manager and configuration
   - Error messages
   - Steps to reproduce

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines.

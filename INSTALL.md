# Installation Guide

This guide will help you install and configure the CargDev-Cyberpunk.nvim color scheme.

## Prerequisites

- Neovim 0.8.0 or higher
- A plugin manager (Packer, Lazy.nvim, vim-plug, etc.)

## Quick Installation

### Using Lazy.nvim (Recommended)

Add this to your Neovim configuration:

```lua
-- In your init.lua or plugins.lua
{
  'cargdev-cyberpunk.nvim',
  config = true,
  priority = 1000, -- Load early
}
```

### Using Packer

```lua
-- In your init.lua or plugins.lua
use {
  'cargdev-cyberpunk.nvim',
  config = function()
    require('cargdev-cyberpunk').setup()
  end
}
```

### Using vim-plug

```vim
" In your .vimrc or init.vim
Plug 'cargdev-cyberpunk.nvim'
```

Then in your Neovim configuration:
```lua
require('cargdev-cyberpunk').setup()
```

## Manual Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/cargdev-cyberpunk.nvim ~/.local/share/nvim/site/pack/plugins/start/cargdev-cyberpunk.nvim
```

2. Add to your Neovim configuration:
```lua
require('cargdev-cyberpunk').setup()
```

## Configuration

### Basic Configuration

```lua
require('cargdev-cyberpunk').setup()
```

### Advanced Configuration

```lua
require('cargdev-cyberpunk').setup({
  -- Configuration options will be added in future versions
})
```

## Verification

To verify the installation:

1. Open Neovim
2. Open a TypeScript file (like the example in `examples/sample.ts`)
3. You should see vibrant colors applied to different syntax elements

### Test the Installation

You can run the test file to verify everything is working:

```lua
-- In Neovim, run:
:lua dofile('test/test_colors.lua')
```

## Troubleshooting

### Colors not appearing

1. Make sure you have Treesitter installed and configured
2. Ensure LSP is properly set up for TypeScript
3. Check that the plugin is loaded correctly

### Plugin not found

1. Verify the plugin is installed in the correct directory
2. Check your plugin manager configuration
3. Restart Neovim after installation

### Performance issues

1. The color scheme is optimized for performance
2. If you experience issues, try disabling other color schemes
3. Ensure you're using Neovim 0.8.0 or higher

## Uninstallation

To remove the color scheme:

1. Remove the plugin from your plugin manager
2. Remove any configuration lines from your Neovim config
3. Restart Neovim

## Support

If you encounter issues:

1. Check the [Issues](https://github.com/yourusername/cargdev-cyberpunk.nvim/issues) page
2. Create a new issue with:
   - Your Neovim version
   - Plugin manager and configuration
   - Error messages
   - Steps to reproduce

## Contributing

See the main README.md for contribution guidelines. 
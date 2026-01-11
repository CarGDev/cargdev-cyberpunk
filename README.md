# CargDev-Cyberpunk.nvim

A vibrant, high-contrast Neovim color scheme crafted for developers who thrive in bold, electrifying visuals. Built with TypeScript support and atomic design principles in mind, this theme delivers blazing neon tones and a cyberpunk aesthetic that maximizes focus and visual impact.

## Features

- **High-Contrast Neon Colors**: Hot pink keywords, electric purple types, vibrant cyan accents, and lush green functions
- **Cyberpunk Aesthetic**: Deep blue backgrounds with neon accents for maximum visual impact
- **TypeScript Support**: Comprehensive LSP and Treesitter highlighting for TypeScript/JavaScript
- **Configurable**: Transparent background, italic/bold toggles, and custom color overrides
- **Plugin Integration**: Native support for Telescope, NvimTree, Neo-tree, GitSigns, nvim-cmp, Lazy.nvim, and more
- **Terminal Colors**: Full 16-color terminal palette for `:terminal`
- **LSP Integration**: Full support for Language Server Protocol highlighting and semantic tokens
- **Treesitter Support**: Advanced syntax highlighting with Treesitter

## Screenshots

### TypeScript
![TypeScript Example](assets/TS_file.png)

### TypeScript React (TSX)
![TypeScript React Example](assets/TSX_file.png)

### CSS
![CSS Example](assets/CSS_file.png)

### JSON
![JSON Example](assets/JSON_file.png)

## Color Palette

### Syntax Colors
| Element | Color | Preview |
|---------|-------|---------|
| Keywords | `#FF79C6` | Control flow and declarations (bold) |
| Functions | `#50FA7B` | Function calls and definitions (bold) |
| Strings | `#FFFFFF` | String literals |
| Numbers | `#FFB86C` | Numeric literals and constants |
| Types | `#BD93F9` | Type annotations and interfaces (bold) |
| Variables | `#BD93F9` | Variable names |
| Properties | `#50FA7B` | Object properties (bold) |
| Comments | `#666666` | Code comments (italic) |

### Background Colors
| Element | Color | Description |
|---------|-------|-------------|
| Primary | `#002B36` | Main background |
| Secondary | `#003B46` | Sidebars and floating windows |
| Tertiary | `#004B56` | Selected tabs and highlights |
| Cursor Line | `#112233` | Current line highlight |
| Selection | `#44475A` | Visual selection |

### Diagnostic Colors
| Type | Color |
|------|-------|
| Error | `#FF5555` |
| Warning | `#FFB86C` |
| Info | `#8BE9FD` |
| Hint | `#50FA7B` |

## Installation

### Using Lazy.nvim (Recommended)

```lua
{
  "yourusername/cargdev-cyberpunk.nvim",
  lazy = false,
  priority = 1000,
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
Plug 'yourusername/cargdev-cyberpunk.nvim'
```

Then in your Lua config:

```lua
require("cargdev-cyberpunk").setup()
```

### Manual Installation

Clone this repository to your Neovim plugins directory:

```bash
git clone https://github.com/yourusername/cargdev-cyberpunk.nvim \
  ~/.local/share/nvim/site/pack/plugins/start/cargdev-cyberpunk.nvim
```

## Configuration

### Basic Setup

```lua
require("cargdev-cyberpunk").setup()
```

### Using Colorscheme Command

After installation, you can load the colorscheme with:

```vim
:colorscheme cargdev-cyberpunk
```

### Advanced Configuration

```lua
require("cargdev-cyberpunk").setup({
  -- Enable transparent background
  transparent = false,

  -- Style options
  italic_comments = true,
  bold_keywords = true,
  bold_functions = true,
  bold_types = true,

  -- Enable terminal colors
  terminal_colors = true,

  -- Custom color overrides
  colors = {
    syntax = {
      keyword = "#FF0000",  -- Make keywords red
    },
    bg = {
      primary = "#000000",  -- Pure black background
    },
  },
})
```

### Configuration Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `transparent` | boolean | `false` | Enable transparent background |
| `italic_comments` | boolean | `true` | Use italic style for comments |
| `bold_keywords` | boolean | `true` | Use bold style for keywords |
| `bold_functions` | boolean | `true` | Use bold style for functions |
| `bold_types` | boolean | `true` | Use bold style for types |
| `terminal_colors` | boolean | `true` | Set terminal colors for `:terminal` |
| `colors` | table | `{}` | Custom color overrides |

## Plugin Support

CargDev-Cyberpunk includes native highlight groups for these plugins:

- **Telescope**: Search and picker UI
- **NvimTree / Neo-tree**: File explorers
- **GitSigns**: Git diff indicators
- **nvim-cmp**: Completion menu
- **indent-blankline**: Indentation guides
- **which-key**: Keybinding hints
- **Lazy.nvim**: Plugin manager UI
- **Mason**: LSP/DAP installer UI
- **bufferline.nvim**: Buffer tabs
- **lualine.nvim**: Status line
- **nvim-notify**: Notification popups
- **noice.nvim**: UI replacement
- **trouble.nvim**: Diagnostics list
- **dashboard-nvim / alpha-nvim**: Start screen
- **Copilot**: AI suggestions

## Architecture

The plugin follows a modular structure:

```
lua/cargdev-cyberpunk/
├── init.lua          # Main entry point and setup
├── colors.lua        # Color palette definitions
├── config.lua        # Configuration management
├── highlights.lua    # Highlight group definitions
└── plugin.lua        # Plugin metadata

colors/
└── cargdev-cyberpunk.lua  # Colorscheme command file

test/
└── test_colors.lua   # Test suite
```

### Modules

- **`init.lua`**: Main setup, load, and apply functions
- **`colors.lua`**: Centralized color palette with override support
- **`config.lua`**: Configuration defaults and user options
- **`highlights.lua`**: All highlight group definitions organized by category
- **`plugin.lua`**: Plugin metadata (name, version, author)

## TypeScript Support

This color scheme includes extensive TypeScript support:

- **LSP Integration**: Full support for TypeScript Language Server highlighting
- **Semantic Tokens**: Enhanced highlighting with LSP semantic tokens
- **Treesitter**: Advanced syntax highlighting with Treesitter
- **Type Annotations**: Special highlighting for type annotations and interfaces
- **Import/Export**: Distinct colors for import and export statements
- **Decorators**: Support for TypeScript decorators
- **Generics**: Proper highlighting for generic types

## Requirements

- Neovim 0.8.0 or higher
- `termguicolors` enabled (automatically set by the plugin)
- Treesitter (recommended for best experience)
- LSP support (recommended for TypeScript features)

## Testing

Run the test suite:

```bash
nvim --headless -c "lua dofile('test/test_colors.lua')"
```

Or from within Neovim:

```lua
:lua dofile('test/test_colors.lua')
```

## API

### Functions

```lua
local cyberpunk = require("cargdev-cyberpunk")

-- Setup with options
cyberpunk.setup(opts)

-- Load/reload the colorscheme
cyberpunk.load()

-- Apply highlights (useful for refreshing)
cyberpunk.apply_highlights()

-- Get the current color palette
local colors = cyberpunk.get_colors()
```

### Accessing Colors

```lua
local colors = require("cargdev-cyberpunk.colors")

-- Get the palette
local palette = colors.palette

-- Override colors
colors.override({
  syntax = {
    keyword = "#FF0000",
  },
})
```

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Development Setup

1. Fork the repository
2. Clone your fork locally
3. Make your changes
4. Run tests: `nvim --headless -c "lua dofile('test/test_colors.lua')"`
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- **Neovim Community**: For the excellent plugin ecosystem
- **Dracula Theme**: Inspiration for some color choices
- **Cyberpunk Aesthetic**: Inspired by the vibrant neon colors of cyberpunk culture

## Support

If you encounter any issues or have questions:

1. Check the [Issues](https://github.com/yourusername/cargdev-cyberpunk.nvim/issues) page
2. Create a new issue with detailed information
3. Include your Neovim version and configuration

---

**Enjoy coding with vibrant colors!**

*"If I squint at this theme, I should feel like Tron is about to compile!"*

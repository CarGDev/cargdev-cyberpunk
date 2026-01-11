# Changelog

All notable changes to CargDev-Cyberpunk.nvim will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

_No unreleased changes._

## [1.1.1] - 2026-01-10

### Added

- `llms.txt` file for AI assistant context - provides LLMs with project structure, API documentation, color palette, and development guidelines

## [1.1.0] - 2026-01-10

### Added

- **Configuration System**: New `config.lua` module with comprehensive options
  - `transparent`: Enable transparent background for terminal transparency
  - `italic_comments`: Toggle italic style for comments
  - `bold_keywords`: Toggle bold style for keywords
  - `bold_functions`: Toggle bold style for functions
  - `bold_types`: Toggle bold style for types
  - `terminal_colors`: Enable/disable terminal color definitions
  - `colors`: Custom color override support

- **Colorscheme Command**: Added `colors/cargdev-cyberpunk.lua` for `:colorscheme cargdev-cyberpunk` support

- **Terminal Colors**: Full 16-color terminal palette for `:terminal` buffers
  - Standard colors (black, red, green, yellow, blue, magenta, cyan, white)
  - Bright variants for all colors

- **Plugin Highlights**: Comprehensive highlight groups for 30+ plugins
  - **File Explorers**: NvimTree, Neo-tree
  - **Fuzzy Finders**: Telescope
  - **Git Integration**: GitSigns, built-in diff
  - **Completion**: nvim-cmp with kind-specific colors
  - **UI Enhancements**: indent-blankline, which-key, bufferline, lualine
  - **Plugin Managers**: Lazy.nvim, Mason
  - **Notifications**: nvim-notify, noice.nvim
  - **Diagnostics**: trouble.nvim
  - **Dashboards**: dashboard-nvim, alpha-nvim
  - **AI**: Copilot suggestions

- **Diagnostic Highlights**: Complete diagnostic highlight groups
  - Virtual text, underline, floating, and sign variants
  - Error, warning, info, hint, and ok severity levels

- **LSP Highlights**: Enhanced LSP support
  - Reference highlighting (text, read, write)
  - Signature help active parameter
  - Code lens and inlay hints
  - Semantic token modifiers (deprecated, readonly, defaultLibrary)

- **Treesitter Highlights**: Expanded treesitter capture groups
  - Comment variants (error, warning, todo, note)
  - Punctuation groups (bracket, delimiter, special)
  - Additional keyword groups (function, operator, return, import, export)

- **Test Suite**: Added `test/test_colors.lua` for verification
  - Tests color palette structure and format
  - Tests configuration defaults
  - Tests highlight group existence
  - Tests module function exports

- **Development Tools**
  - `selene.toml`: Lua linting configuration
  - `stylua.toml`: Lua formatting configuration
  - `vim.toml`: Neovim globals definition for selene

### Changed

- **Architecture Refactor**: Modular design with separated concerns
  - `init.lua`: Main entry point with setup, load, and apply functions
  - `colors.lua`: Centralized color palette with override support
  - `config.lua`: Configuration management with defaults
  - `highlights.lua`: All highlight group definitions organized by category
  - `plugin.lua`: Plugin metadata

- **Color Module**: Now properly integrated with init.lua
  - Added `palette` table structure with typed annotations
  - Added `override()` function for runtime color customization
  - Added `get_palette()` function to retrieve a copy of colors

- **Init Module**: Complete rewrite
  - `setup(opts)` now accepts and applies configuration options
  - `load()` function properly resets colors and sets `vim.g.colors_name`
  - `apply_highlights()` uses colors and config modules
  - `apply_terminal_colors()` sets `vim.g.terminal_color_*` variables
  - `get_colors()` returns the current color palette

- **Plugin Metadata**: Updated version to 1.1.0 in `plugin.lua`

### Fixed

- **Color Inconsistency**: `init.lua` now uses `colors.lua` instead of defining colors inline
- **Unused Colors Module**: The `colors.lua` module is now properly imported and used
- **Non-functional Configuration**: `setup(opts)` now actually applies user options
- **Documentation Errors**: README and INSTALL.md now reference correct file structure

### Documentation

- Updated README.md with:
  - Configuration options table
  - Plugin support list
  - Correct architecture diagram
  - API documentation
  - Testing instructions

- Updated INSTALL.md with:
  - Advanced configuration examples
  - Troubleshooting section
  - Verification steps

- Updated CONTRIBUTING.md with:
  - Correct file structure

## [1.0.0] - 2024-01-01

### Added

- Initial release of CargDev-Cyberpunk.nvim
- Cyberpunk-inspired color palette with neon accents
- Deep blue background (`#002B36`) with vibrant syntax colors
- Basic syntax highlighting for Vim default groups
- Treesitter highlight support
- LSP semantic token highlighting
- TypeScript/JavaScript optimized colors
- Basic editor UI highlights (Normal, Cursor, Visual, Search, etc.)
- Status line and tab line highlights
- Popup menu highlights
- Diff highlights
- Spell checking highlights
- Copilot suggestion highlights
- MIT License
- README with installation instructions
- INSTALL.md guide
- CONTRIBUTING.md guidelines
- Example TypeScript file for testing

### Color Palette

- **Background**: `#002B36` (deep blue)
- **Foreground**: `#E0E0E0` (light gray)
- **Keywords**: `#FF79C6` (hot pink)
- **Functions**: `#50FA7B` (neon green)
- **Strings**: `#FFFFFF` (white)
- **Numbers**: `#FFB86C` (orange)
- **Types**: `#BD93F9` (purple)
- **Comments**: `#666666` (gray)
- **Errors**: `#FF5555` (red)
- **Warnings**: `#FFB86C` (orange)
- **Info**: `#8BE9FD` (cyan)

[Unreleased]: https://github.com/yourusername/cargdev-cyberpunk.nvim/compare/v1.1.1...HEAD
[1.1.1]: https://github.com/yourusername/cargdev-cyberpunk.nvim/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/yourusername/cargdev-cyberpunk.nvim/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/yourusername/cargdev-cyberpunk.nvim/releases/tag/v1.0.0

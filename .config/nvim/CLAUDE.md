# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Architecture

This is a modular Neovim configuration using **lazy.nvim** as the plugin manager. The configuration follows a clean separation of concerns:

- `lua/config/` - Core Neovim configuration (options, keymaps, autocmds, lazy.nvim setup)
- `lua/plugins/` - Individual plugin configurations, each in its own file
- `lazy-lock.json` - Plugin version lockfile (similar to package-lock.json)

## Plugin Management

Uses lazy.nvim with automatic installation and lazy loading. Plugins are defined in individual files under `lua/plugins/` and automatically imported. Key plugins include:

- **blink.cmp** - Rust-based completion engine
- **Oil.nvim** - File explorer (replaces netrw)
- **Telescope** - Fuzzy finder
- **LSP** - Language servers for Go, TypeScript, Lua, Nix, HTML/CSS, Zig, Templ
- **Harpoon2** - Quick file navigation

## Development Commands

### Configuration Management
- Edit plugin configurations in `lua/plugins/[plugin-name].lua`
- Restart Neovim to reload configuration changes
- `:Lazy` - Open plugin manager UI
- `:Lazy sync` - Update/install plugins based on lockfile

### Key Bindings
- `<Space>` - Leader key, `\` - Local leader
- `<leader>dv` - Open Oil file explorer
- `<leader>ff` - Telescope find files
- `<leader>fg` - Telescope live grep
- `<leader>a` - Harpoon add file
- `<leader>e` - Harpoon toggle menu
- `<leader>hjkl` - Navigate to Harpoon files 1-4
- `<leader>f` - Format buffer via LSP
- `<leader>lr` - LSP rename

### LSP and Formatting
Auto-formatting is enabled on save for Go, Nix, Templ, TypeScript/JavaScript, Zig, Lua, and JSON files via LSP. The conform.lua formatter is currently disabled in favor of LSP formatting.

## Configuration Patterns

- Each plugin should have its own file in `lua/plugins/`
- Plugin files should return lazy.nvim plugin specifications
- Use lazy loading where appropriate (`lazy = false` for essential plugins)
- Keep global keymaps minimal - define keymaps within plugin configurations
- Follow the existing naming conventions for plugin files

## Target Development Stack

This configuration is optimized for:
- Web development (TypeScript, Tailwind CSS, Templ templating)
- Go development
- Nix/NixOS system configuration
- General programming with modern LSP tooling
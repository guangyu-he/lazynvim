# Neovim Configuration for Rust Development

A comprehensive Neovim setup optimized for Rust development using lazy.nvim plugin manager.

## Features

- **LSP Support**: Full rust-analyzer integration with code completion, diagnostics, and formatting
- **Syntax Highlighting**: Treesitter-powered syntax highlighting for Rust and other languages
- **Code Completion**: nvim-cmp with snippet support
- **Fuzzy Finding**: Telescope for file navigation and searching
- **File Explorer**: Neo-tree for project navigation
- **Git Integration**: Gitsigns for git status in the editor
- **Rust-specific Tools**:
  - rust-tools.nvim for enhanced Rust development
  - crates.nvim for Cargo.toml dependency management
  - Automatic formatting on save with rustfmt
  - Clippy integration for linting

## Prerequisites

Before installing, make sure you have the following installed:

```bash
# Neovim 0.9.0 or later
nvim --version

# Rust and cargo
rustc --version
cargo --version

# rust-analyzer (LSP server for Rust)
rustup component add rust-analyzer

# ripgrep (for Telescope live_grep)
rg --version

# fd (optional, for better file finding)
fd --version

# A Nerd Font (for icons)
# Download from: https://www.nerdfonts.com/
```

## Installation

### 1. Backup existing Neovim configuration

```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
```

### 2. Install this configuration

```bash
# Copy the configuration files to your Neovim config directory
cp -r /home/claude/nvim-rust-config ~/.config/nvim

# Or clone if you have it in a git repository
# git clone <your-repo-url> ~/.config/nvim
```

### 3. Start Neovim

```bash
nvim
```

On first launch, lazy.nvim will automatically:
- Install itself
- Install all configured plugins
- Set up LSP servers

This may take a few minutes. Wait for all plugins to install.

## Key Bindings

### General

| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `<Space>w` | Save file |
| `<Space>q` | Quit |
| `<Space>x` | Save and quit |
| `<Esc>` | Clear search highlights |

### Window Navigation

| Key | Action |
|-----|--------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to bottom window |
| `<C-k>` | Move to top window |
| `<C-l>` | Move to right window |

### Buffer Navigation

| Key | Action |
|-----|--------|
| `<S-l>` | Next buffer |
| `<S-h>` | Previous buffer |
| `<Space>bd` | Close buffer |

### File Explorer

| Key | Action |
|-----|--------|
| `<Space>e` | Toggle Neo-tree file explorer |

### Fuzzy Finding (Telescope)

| Key | Action |
|-----|--------|
| `<Space>ff` | Find files |
| `<Space>fg` | Live grep (search in files) |
| `<Space>fb` | Find buffers |
| `<Space>fh` | Help tags |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Show references |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `K` | Show hover documentation |
| `<Space>ca` | Code actions |
| `<Space>rn` | Rename symbol |
| `[d` | Go to previous diagnostic |
| `]d` | Go to next diagnostic |
| `<Space>d` | Show line diagnostics |
| `<Space>D` | Show buffer diagnostics |
| `<Space>rs` | Restart LSP |

### Rust-specific

| Key | Action |
|-----|--------|
| `<C-Space>` | Hover actions (rust-tools) |
| `<Space>a` | Code action groups |

### Code Completion

| Key | Action |
|-----|--------|
| `<C-k>` | Previous item |
| `<C-j>` | Next item |
| `<C-Space>` | Trigger completion |
| `<C-e>` | Abort completion |
| `<CR>` | Confirm selection |

### Comments

| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gc` | Toggle comment (with motion) |

## Project Structure

```
~/.config/nvim/
├── init.lua                    # Main entry point
├── lua/
│   ├── config/
│   │   ├── options.lua         # Neovim options
│   │   ├── keymaps.lua         # Key bindings
│   │   └── autocmds.lua        # Autocommands
│   └── plugins/
│       ├── colorscheme.lua     # Theme configuration
│       ├── telescope.lua       # Fuzzy finder
│       ├── neo-tree.lua        # File explorer
│       ├── treesitter.lua      # Syntax highlighting
│       ├── lsp.lua             # LSP configuration
│       ├── nvim-cmp.lua        # Completion
│       ├── rust.lua            # Rust-specific plugins
│       └── utilities.lua       # Additional utilities
```

## Customization

### Change Colorscheme

Edit `lua/plugins/colorscheme.lua`:

```lua
-- Replace tokyonight with another theme
return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    vim.cmd([[colorscheme catppuccin]])
  end,
}
```

### Add More Plugins

Create a new file in `lua/plugins/` directory:

```lua
-- lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  config = function()
    -- Plugin configuration
  end,
}
```

### Modify LSP Settings

Edit `lua/plugins/lsp.lua` to customize rust-analyzer settings.

### Change Keybindings

Edit `lua/config/keymaps.lua` to modify or add key bindings.

## Rust Development Workflow

### Starting a New Project

```bash
cargo new my-project
cd my-project
nvim .
```

### Opening an Existing Project

```bash
cd my-rust-project
nvim .
```

### Common Tasks

1. **Format code**: Automatically formats on save with rustfmt
2. **Run clippy**: Diagnostics appear inline with clippy suggestions
3. **Go to definition**: Use `gd` to jump to function/struct definitions
4. **Find references**: Use `gr` to find all usages
5. **Rename symbol**: Use `<Space>rn` to rename across the project
6. **Code actions**: Use `<Space>ca` for quick fixes and refactoring

### Managing Dependencies

When editing `Cargo.toml`, the crates.nvim plugin will show:
- Available versions for crates
- Updates for dependencies
- Documentation for crates

## Troubleshooting

### LSP not starting

Check if rust-analyzer is installed:
```bash
rustup component add rust-analyzer
```

Restart LSP:
```
:LspRestart
```

### Plugins not loading

Update plugins:
```
:Lazy update
```

### Tree-sitter errors

Update parsers:
```
:TSUpdate
```

### Check health

Run Neovim health check:
```
:checkhealth
```

## Additional Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [rust-analyzer](https://rust-analyzer.github.io/)
- [Rust Book](https://doc.rust-lang.org/book/)

## License

This configuration is provided as-is for personal use and modification.

# Neovim Configuration for Rust, Python & More

A modern, feature-rich Neovim setup optimized for Rust and Python development with AI-powered coding assistance.

## 🚀 Features

### Core Features
- **LSP Support** - Full language server protocol integration
- **Smart Autocompletion** - Context-aware code completion with snippets
- **Syntax Highlighting** - Treesitter-powered highlighting
- **Fuzzy Finding** - Fast file and text search (Telescope)
- **File Explorer** - Neo-tree for project navigation
- **Git Integration** - Inline git status and diffs

### Language-Specific

#### Rust 🦀
- **rust-analyzer** - Full IntelliSense support
- **Clippy** - Automatic linting on save
- **rustfmt** - Auto-formatting on save
- **Cargo.toml** - Dependency management with crates.nvim

#### Python 🐍
- **basedpyright** - Fast LSP with type checking (mypy)
- **ruff** - Lightning-fast linting and formatting
- **uv support** - Modern Python package management
- **Virtual Environment** - Auto-detection and selection
- **pytest** - Integrated test runner with neotest

#### Nginx
- **nginxfmt** - Auto-formatting on save for nginx configs

### AI & Productivity
- **GitHub Copilot** - AI-powered code suggestions
- **Auto-formatting** - Format on save for Rust, Python, Nginx
- **Comment Toggle** - Quick comment/uncomment
- **Multiple Cursors** - Visual block editing
- **Which-key** - Interactive keybinding hints

### UI Enhancements
- **Tokyo Night Theme** - Modern, eye-friendly color scheme
- **Statusline** - Informative lualine
- **Buffer Tabs** - Easy buffer management
- **Git Signs** - Inline git status indicators
- **Indent Guides** - Visual indentation helpers

---

## 📦 Clean Installation

### Prerequisites

#### Required
```bash
# Neovim 0.9.0 or later
brew install neovim

# Git
brew install git

# Rust & Cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer rustfmt clippy

# Node.js 18+ (for Copilot)
brew install node

# ripgrep (for Telescope search)
brew install ripgrep

# fd (for fast file finding)
brew install fd
```

#### Python Development (Optional)
```bash
# uv (modern Python package manager)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Python tools
uv tool install ruff
uv tool install mypy
uv tool install basedpyright
```

#### Nginx Development (Optional)
```bash
# nginxfmt
pip install nginxfmt
```

### Installation Steps

#### 1. Clean Slate
```bash
# Remove ALL existing Neovim data
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

#### 2. Install Configuration
```bash
# Extract the configuration
unzip nvim-rust-config.zip

# Copy to Neovim config directory
cp -r nvim-rust-config ~/.config/nvim
```

#### 3. First Launch
```bash
# Start Neovim
nvim
```

**Wait 2-3 minutes** for lazy.nvim to install all plugins automatically.

#### 4. Setup Copilot
```vim
:Copilot auth
```

Follow the browser prompts to authenticate with GitHub.

#### 5. Verify Installation
```vim
:checkhealth
```

Check for any errors or warnings.

---

## ⌨️ Essential Keybindings

**Leader Key:** `Space`

### File Operations
| Key | Action |
|-----|--------|
| `Space + w` | Save file |
| `Space + q` | Quit |
| `Space + e` | Toggle file explorer |

### Navigation
| Key | Action |
|-----|--------|
| `Space + ff` | Find files |
| `Space + fg` | Search text in files |
| `Space + fb` | Find open buffers |
| `Ctrl + h/j/k/l` | Navigate between windows |
| `Shift + h/l` | Previous/next buffer |

### LSP & Code Intelligence
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Show references |
| `gi` | Go to implementation |
| `K` | Show documentation |
| `Space + ca` | Code actions (imports, fixes) |
| `Space + rn` | Rename symbol |
| `[d` / `]d` | Previous/next diagnostic |
| `Space + d` | Show line diagnostics |

### GitHub Copilot
| Key | Action |
|-----|--------|
| `Option + l` | Accept suggestion |
| `Option + ,` | Next suggestion |
| `Option + .` | Previous suggestion |
| `Option + -` | Dismiss suggestion |
| `Option + Enter` | Open suggestion panel |

### Python Development
| Key | Action |
|-----|--------|
| `Space + vs` | Select virtual environment |
| `Space + tt` | Run nearest test |
| `Space + tf` | Run all tests in file |
| `Space + ts` | Toggle test summary |

### Editing
| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gc` + motion | Comment with motion |
| `Space + f` | Format buffer |
| `<` / `>` | Indent left/right (visual mode) |

### Search & Replace
| Key | Action |
|-----|--------|
| `/pattern` | Search forward |
| `n` / `N` | Next/previous match |
| `:%s/old/new/g` | Replace all in file |

### Visual Block Mode
| Key | Action |
|-----|--------|
| `Ctrl + v` | Enter visual block mode |
| `I` | Insert at start of lines |
| `A` | Append at end of lines |

---

## 🎯 Quick Start Workflows

### Rust Development
```bash
# Create new project
cargo new my-project
cd my-project

# Open in Neovim
nvim src/main.rs
```

In Neovim:
1. Start typing - Copilot suggests code
2. Press `gd` to jump to definitions
3. Press `Space + ca` for quick fixes
4. Save - auto-formats with rustfmt
5. Clippy warnings appear inline

### Python Development with uv
```bash
# Create project
mkdir my-project && cd my-project
uv init
uv add requests pytest

# Open in Neovim
nvim main.py
```

In Neovim:
1. Press `Space + vs` to select virtual environment
2. Write code - get type hints and autocomplete
3. Save - auto-formats with ruff
4. Press `Space + tt` to run tests

### Nginx Configuration
```bash
# Edit nginx config
nvim nginx.conf
```

Save the file - auto-formats with nginxfmt.

---

## 🔧 Configuration

### File Structure
```
~/.config/nvim/
├── init.lua                    # Main entry point
├── lua/
│   ├── config/
│   │   ├── options.lua         # Editor settings
│   │   ├── keymaps.lua         # Key bindings
│   │   ├── autocmds.lua        # Auto commands
│   │   └── lsp-keymaps.lua     # LSP keybindings
│   └── plugins/
│       ├── lsp.lua             # LSP configuration
│       ├── copilot.lua         # Copilot setup
│       ├── python.lua          # Python tools
│       ├── formatter.lua       # Formatters
│       ├── rust.lua            # Rust-specific
│       └── ...                 # Other plugins
```

### Customization

#### Change Theme
Edit `lua/plugins/colorscheme.lua`:
```lua
return {
  "catppuccin/nvim",  -- Change to your preferred theme
  config = function()
    vim.cmd([[colorscheme catppuccin]])
  end,
}
```

#### Modify Keybindings
Edit `lua/config/keymaps.lua` or `lua/config/lsp-keymaps.lua`.

#### Add Plugins
Create a new file in `lua/plugins/`:
```lua
-- lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  config = function()
    -- Plugin configuration
  end,
}
```

---

## 🐛 Troubleshooting

### LSP Not Working

**Check LSP status:**
```vim
:LspInfo
```

**Restart LSP:**
```vim
:LspRestart
```

**Verify tools are installed:**
```bash
which rust-analyzer
which ruff
which basedpyright
```

### Copilot Not Working

**Check status:**
```vim
:Copilot status
```

**Re-authenticate:**
```vim
:Copilot auth
```

**Check Node.js version:**
```bash
node --version  # Should be >= 18.x
```

### Icons Not Showing

Install a Nerd Font:
1. Download from https://www.nerdfonts.com/
2. Recommended: JetBrainsMono Nerd Font
3. Install and set in your terminal

### Plugins Not Loading

**Sync plugins:**
```vim
:Lazy sync
```

**Check plugin status:**
```vim
:Lazy
```

### General Health Check
```vim
:checkhealth
```

---

## 📊 Supported File Types

### Full Support (LSP + Formatting + Linting)
- Rust (`.rs`)
- Python (`.py`)
- Nginx (`.conf`, `nginx.conf`)
- Lua (`.lua`)
- TOML (`.toml`)

### Syntax Highlighting Only
- JSON, YAML, Markdown
- Bash, Shell scripts
- And many more via Treesitter

---

## 🎓 Learning Tips

### Day 1: Navigation
- Master `Space + e` (file explorer)
- Learn `Space + ff` (find files)
- Practice `gd` (go to definition)

### Day 2: LSP Features
- Use `K` to see documentation
- Try `Space + ca` for code actions
- Practice `Space + rn` for renaming

### Day 3: Copilot
- Start typing and accept suggestions with `Option + l`
- Cycle through options with `Option + ,` and `Option + .`
- Write comments to guide Copilot

### Week 2: Customization
- Modify keybindings in `lua/config/keymaps.lua`
- Add your own plugins
- Adjust settings in `lua/config/options.lua`

---

## 🆘 Getting Help

### In Neovim
- `:help` - Built-in help
- `Space` + wait - Which-key shows available commands
- `:Telescope keymaps` - Search all keybindings
- `:checkhealth` - Diagnostic information

### Resources
- [Neovim Documentation](https://neovim.io/doc/)
- [Rust Analyzer Guide](https://rust-analyzer.github.io/)
- [GitHub Copilot Docs](https://github.com/features/copilot)

---

## 📝 Notes

- **Auto-save:** Not enabled by default. Press `Space + w` to save.
- **Format on save:** Enabled for Rust, Python, and Nginx files.
- **Virtual environments:** Python LSP automatically uses selected venv.
- **Cargo projects:** Rust LSP requires a `Cargo.toml` file.
- **Copilot:** Requires active GitHub Copilot subscription.

---

## ⚡ Quick Reference

### Most Used Commands
```
Space + e       → File explorer
Space + ff      → Find files
Space + fg      → Search in files
gd              → Go to definition
K               → Show docs
Space + ca      → Code actions
Option + l      → Accept Copilot
Space + vs      → Select Python venv
Space + tt      → Run test
gcc             → Comment line
Space + w       → Save
```

### After Installation
1. Start Neovim: `nvim`
2. Authenticate Copilot: `:Copilot auth`
3. Open a Rust/Python project
4. Start coding! 🚀

---

## 📜 License

This configuration is provided as-is for personal use and modification.

---

**Enjoy your modern Neovim development environment!** 🎉

For issues or questions, use `:checkhealth` to diagnose problems.

# Neovim: Lightweight Code Reader

A minimal Neovim setup focused on reading code, with light editing support. No LSP, few dependencies, fast startup.

## What's Inside

- **Syntax highlighting** via Treesitter: Python, Rust, HTML/CSS/JS/TS, nginx, shell, JSON/YAML/TOML/XML, SQL, Markdown, Dockerfile, diff, Lua
- **Fuzzy finder**: Telescope (`<leader>ff` files, `<leader>fg` grep, `<leader>fb` buffers)
- **File tree**: neo-tree (`<leader>e`)
- **Formatters** (manual, no format-on-save): `ruff` (Python), `rustfmt` (Rust), `nginxfmt` (nginx) — bind: `<leader>fm`
- **Copilot** for occasional editing
- **UI polish**: gruvbox (soft dark), lualine, bufferline, gitsigns, indent-blankline, which-key
- **Editing**: `gcc` to comment lines

No LSP, no completion popup, no autopairs, no test runners, no venv selectors.

## Prerequisites

```bash
# Required
brew install neovim git ripgrep fd

# Optional — only if you want the formatters
pip install nginxfmt              # nginx
# ruff: pip install ruff  OR  uv tool install ruff
# rustfmt: ships with rustup
```

Copilot needs Node.js >= 18 and a GitHub Copilot account (Free tier works, with monthly completion limits).

## Install

```bash
# Back up any existing config first
git clone <this repo> ~/.config/nvim
nvim   # first run will install plugins via lazy.nvim
```

After first launch:

```vim
:Lazy sync
:TSUpdate
:Copilot auth     " optional
:checkhealth
```

## Key Bindings

Leader is `Space`.

| Key | Action |
|---|---|
| `<leader>w` / `<leader>q` | Save / Quit |
| `<leader>e` | Toggle file tree |
| `<leader>ff` / `<leader>fg` / `<leader>fb` | Find files / Live grep / Buffers |
| `<S-h>` / `<S-l>` | Prev / Next buffer |
| `<leader>bd` | Close buffer |
| `<C-h/j/k/l>` | Move between windows |
| `gcc` / `gc` + motion | Toggle comment |
| `<leader>fm` | Format buffer (Python/Rust/nginx) |
| `<Esc>` | Clear search highlight |
| `<M-l>` / `<M-,>` / `<M-.>` / `<M-->` | Copilot: accept / next / prev / dismiss |

## File Structure

```
~/.config/nvim/
├── init.lua
└── lua/
    ├── config/
    │   ├── options.lua     # Editor options
    │   ├── keymaps.lua     # Key bindings
    │   └── autocmds.lua    # yank highlight, trim whitespace, q-to-close
    └── plugins/
        ├── colorscheme.lua  # gruvbox
        ├── treesitter.lua   # syntax highlighting
        ├── telescope.lua    # fuzzy find
        ├── neo-tree.lua     # file tree
        ├── conform.lua      # formatters (manual)
        ├── copilot.lua      # AI suggestions
        └── utilities.lua    # gitsigns, lualine, bufferline, ibl, which-key, Comment
```

## Customization

- **Theme**: edit `lua/plugins/colorscheme.lua` (change `contrast = "soft"` to `medium`/`hard`).
- **Add a treesitter language**: append to `ensure_installed` in `lua/plugins/treesitter.lua`.
- **Add a formatter**: extend `formatters_by_ft` in `lua/plugins/conform.lua`.

## Notes

- `nvim-treesitter` is pinned to the `master` branch. The default `main` branch is the 1.0 rewrite with a new API (`vim.treesitter.start()` based) that drops `require("nvim-treesitter.configs")`. `master` is archived upstream but still works for syntax highlighting, which is all this config needs.

## Troubleshooting

```vim
:checkhealth      " general diagnostics
:Lazy             " plugin status
:TSInstallInfo    " treesitter parser status
:ConformInfo      " formatter status
:Copilot status
```

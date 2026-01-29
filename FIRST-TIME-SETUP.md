# First-Time Setup Guide

**IMPORTANT:** Follow these steps IN ORDER to avoid errors.

## Prerequisites Check

Before installing, make sure you have:

```bash
# 1. Neovim 0.9.0 or later
nvim --version
# Should show NVIM v0.9.0 or higher

# 2. Git
git --version

# 3. Rust and cargo
rustc --version
cargo --version
```

If any of these are missing, install them first:

**Neovim:**
- macOS: `brew install neovim`
- Ubuntu: `sudo snap install nvim --classic` or build from source
- Arch: `sudo pacman -S neovim`

**Rust:**
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
```

## Step-by-Step Installation

### Step 1: Complete Clean Slate

```bash
# Remove ALL old Neovim data
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

**Why?** Old plugin data can conflict with the new setup.

### Step 2: Extract Configuration

```bash
# Extract the downloaded zip file
unzip nvim-rust-config.zip

# Copy to the Neovim config directory
cp -r nvim-rust-config ~/.config/nvim
```

### Step 3: First Launch (Critical!)

```bash
# Launch Neovim
nvim
```

**What happens now:**
1. lazy.nvim will clone itself (5-10 seconds)
2. All plugins will start installing (2-3 minutes)
3. You'll see download progress

**DO NOT:**
- Close Neovim during installation
- Press any keys
- Try to open files

**Just wait** until you see: "All plugins are up to date"

### Step 4: Verify Installation

Once plugins are installed, in Neovim run:

```vim
:Lazy
```

You should see a list of installed plugins. All should show as "loaded" or "not loaded" (this is normal for lazy-loaded plugins).

### Step 5: Install Language Parsers

Still in Neovim, run:

```vim
:TSInstall rust toml lua
```

Wait for the parsers to compile (1-2 minutes).

### Step 6: Restart Neovim

```vim
:q
```

Then relaunch:
```bash
nvim
```

### Step 7: Verify LSP

```bash
# Create a test Rust project
cargo new test-project
cd test-project
nvim src/main.rs
```

In Neovim, check if LSP is working:

```vim
:LspInfo
```

You should see: `rust_analyzer` attached to the buffer.

## If You See Errors

### Error: "module 'nvim-treesitter.configs' not found"

**Solution:**

1. In Neovim, run:
   ```vim
   :Lazy sync
   ```

2. Wait for completion, then run:
   ```vim
   :TSUpdate
   ```

3. Restart Neovim:
   ```vim
   :q
   ```

4. If still not working, repeat Step 1-7 above with a complete clean slate.

### Error: "rust-analyzer not found"

**Solution:**

```bash
# Install rust-analyzer
rustup component add rust-analyzer

# Verify it's in PATH
which rust-analyzer

# Restart Neovim
```

### Error: Icons showing as boxes

**Solution:**

1. Install a Nerd Font from https://www.nerdfonts.com/
2. Recommended: JetBrainsMono Nerd Font
3. Set your terminal to use the Nerd Font
4. Restart your terminal and Neovim

## Post-Installation Steps

### 1. Install Optional Dependencies

```bash
# For better file finding
brew install fd  # macOS
sudo apt install fd-find  # Ubuntu

# For live grep in Telescope (required)
brew install ripgrep  # macOS
sudo apt install ripgrep  # Ubuntu
```

### 2. Install Rust Tools

```bash
# rust-analyzer (LSP)
rustup component add rust-analyzer

# rustfmt (formatter)
rustup component add rustfmt

# clippy (linter)
rustup component add clippy
```

### 3. Verify Everything Works

```bash
# Create a test project
cargo new hello-rust
cd hello-rust
nvim src/main.rs
```

**Test these features:**
- Type `fn test` - should show autocomplete
- Hover over `println!` - should show docs (press `K`)
- Save the file - should auto-format
- Add an unused variable - should show warning

## Troubleshooting Quick Reference

| Problem | Solution |
|---------|----------|
| Plugins not installing | `:Lazy sync` then restart |
| Treesitter errors | `:TSUpdate` then restart |
| LSP not working | `:LspInfo` to check, `:LspRestart` to restart |
| Slow startup | Normal on first launch, fast afterwards |
| No icons | Install a Nerd Font |

## Success Checklist

- [ ] Neovim starts without errors
- [ ] `:Lazy` shows all plugins installed
- [ ] `:LspInfo` shows rust_analyzer attached (in .rs file)
- [ ] Autocomplete works when typing
- [ ] File explorer opens with `Space+e`
- [ ] Find files works with `Space+ff`
- [ ] Format on save works

If all checked, congratulations! You're ready to code.

## Getting Help

- See `TROUBLESHOOTING.md` for detailed solutions
- Run `:checkhealth` in Neovim for diagnostics
- Check `:messages` for error messages

## Next Steps

- Read `QUICKSTART.md` for essential keybindings
- Read `README.md` for full documentation
- Start coding! `cargo new my-project && cd my-project && nvim src/main.rs`

Happy coding! 🦀

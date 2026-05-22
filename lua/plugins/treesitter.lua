-- Treesitter: syntax highlighting only (no LSP)
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",      -- pin to legacy API (`main` is 1.0 rewrite)
  build = ":TSUpdate",
  lazy = false,
  priority = 100,
  config = function()
    local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      vim.notify("nvim-treesitter not loaded yet. Run :Lazy sync and restart", vim.log.levels.WARN)
      return
    end

    treesitter_configs.setup({
      ensure_installed = {
        "python", "rust",
        "html", "css", "javascript", "typescript",
        "nginx",
        "lua", "vim", "vimdoc",
        "bash", "json", "toml", "yaml", "xml", "sql",
        "markdown", "markdown_inline",
        "dockerfile", "diff",
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}

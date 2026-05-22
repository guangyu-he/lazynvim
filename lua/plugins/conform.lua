-- Formatter: conform.nvim (manual trigger only, no format-on-save)
-- Requires these binaries on PATH:
--   ruff       (Python)
--   rustfmt    (Rust, bundled with rustup)
--   nginxfmt   (nginx, e.g. `pip install nginxfmt`)
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "ruff_format" },
        rust   = { "rustfmt" },
        nginx  = { "nginxfmt" },
      },
      formatters = {
        nginxfmt = {
          command = "nginxfmt",
          args = { "-" },
          stdin = true,
        },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      require("conform").format({ async = true, lsp_fallback = false })
    end, { desc = "Format buffer" })
  end,
}

-- Python Development Environment (uv + ruff + mypy)
return {
  -- Python-specific utilities
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
    },
    lazy = false,
    config = function()
      require("venv-selector").setup({
        -- Search settings
        settings = {
          search = {
            anaconda = false,
            venv = {
              command = "fd python$ .venv/bin --full-path --no-ignore",
            },
          },
          options = {
            notify_user_on_venv_activation = true,
          },
        },
      })
    end,
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
      { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select Cached VirtualEnv" },
    },
  },

  -- Python testing support
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            -- Use pytest by default
            runner = "pytest",
            -- Support for uv
            python = function()
              -- Try to use uv's python if available
              local handle = io.popen("uv run which python 2>/dev/null")
              if handle then
                local result = handle:read("*a")
                handle:close()
                if result and result ~= "" then
                  return vim.trim(result)
                end
              end
              -- Fallback to system python
              return "python3"
            end,
            args = { "--log-level", "DEBUG", "-vv" },
          }),
        },
      })
    end,
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end, desc = "Test Nearest" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test File" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Test Summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Test Output" },
    },
  },
}

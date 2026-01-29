-- Nginx Formatter Configuration
return {
  -- Formatter plugin
  "mhartington/formatter.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local util = require("formatter.util")
    
    require("formatter").setup({
      logging = true,
      log_level = vim.log.levels.WARN,
      
      filetype = {
        -- Nginx configuration formatter
        nginx = {
          function()
            return {
              exe = "nginxfmt",
              args = {
                "-",  -- Read from stdin
              },
              stdin = true,
            }
          end,
        },
        
        -- Python formatter (using ruff)
        python = {
          function()
            return {
              exe = "ruff",
              args = {
                "format",
                "--stdin-filename",
                util.escape_path(util.get_current_buffer_file_path()),
                "-",
              },
              stdin = true,
            }
          end,
        },
        
        -- Fallback for all other filetypes
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    })

    -- Auto-format on save for nginx and python files
    local format_group = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
    
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.conf", "nginx.conf", "*.nginx" },
      group = format_group,
      callback = function()
        vim.cmd("FormatWrite")
      end,
    })
    
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*.py",
      group = format_group,
      callback = function()
        vim.cmd("FormatWrite")
      end,
    })

    -- Keymap to manually format
    vim.keymap.set("n", "<leader>fm", ":Format<CR>", { desc = "Format current buffer" })
    vim.keymap.set("n", "<leader>fw", ":FormatWrite<CR>", { desc = "Format and write" })
  end,
}

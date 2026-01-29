-- Autocommands Configuration
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Remove trailing whitespace on save
local trim_whitespace = augroup("TrimWhitespace", { clear = true })
autocmd("BufWritePre", {
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
  group = trim_whitespace,
  pattern = "*",
})

-- Auto format on save for Rust files
local rust_format = augroup("RustFormat", { clear = true })
autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
  group = rust_format,
  pattern = "*.rs",
})

-- Close certain filetypes with q
local close_with_q = augroup("CloseWithQ", { clear = true })
autocmd("FileType", {
  pattern = {
    "help",
    "lspinfo",
    "man",
    "qf",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
  group = close_with_q,
})

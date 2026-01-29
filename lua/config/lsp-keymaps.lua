-- Simple LSP Keymaps Setup
-- Add this file to: ~/.config/nvim/lua/config/lsp-keymaps.lua
-- Then add require("config.lsp-keymaps") to your init.lua

-- Set up keymaps whenever LSP attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
  callback = function(event)
    local bufnr = event.buf
    local opts = function(desc)
      return { buffer = bufnr, noremap = true, silent = true, desc = desc }
    end

    -- Navigation keymaps
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts('Go to definition'))
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts('Go to declaration'))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts('Show references'))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts('Go to implementation'))
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts('Go to type definition'))

    -- Documentation
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts('Hover documentation'))

    -- Code actions
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts('Code action'))
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts('Rename'))

    -- Diagnostics
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts('Previous diagnostic'))
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts('Next diagnostic'))
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts('Show diagnostic'))
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts('Diagnostic list'))

    -- Format
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format({ async = false })
    end, opts('Format buffer'))

    -- Print confirmation
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    print(string.format("LSP keymaps set for %s (buffer %d)", client.name, bufnr))
  end,
})

-- Also set keymaps for already attached LSP clients
vim.defer_fn(function()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) then
      local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
      if #clients > 0 then
        local opts = function(desc)
          return { buffer = bufnr, noremap = true, silent = true, desc = desc }
        end

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts('Go to definition'))
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts('Go to declaration'))
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts('Show references'))
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts('Go to implementation'))
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts('Go to type definition'))
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts('Hover documentation'))
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts('Code action'))
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts('Rename'))
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts('Previous diagnostic'))
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts('Next diagnostic'))
        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts('Show diagnostic'))
        
        print("Keymaps also set for existing buffer " .. bufnr)
      end
    end
  end
end, 100)

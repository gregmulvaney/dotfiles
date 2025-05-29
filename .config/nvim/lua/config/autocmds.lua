vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', '<leader>ll', vim.lsp.buf.hover, opts)
        -- Other LSP keybinds...
    end,
})

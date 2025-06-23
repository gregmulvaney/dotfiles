--vim.api.nvim_create_autocmd("LspAttach", {
--    callback = function(ev)
--        local opts = { buffer = ev.buf }
--        vim.keymap.set("n", "<leader>ll", vim.lsp.buf.hover, opts)
--        -- Other LSP keybinds...
--    end,
--})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go", "*.nix", "*.templ", "*.ts", "*.js", "*.zig", "*.lua", "*.tsx", "*.jsx", "*.json" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*oil",
    callback = function()
        vim.b.completion = false
    end
})

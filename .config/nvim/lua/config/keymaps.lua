vim.keymap.set("n", "<leader>dv", vim.cmd.Ex)

-- Format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")


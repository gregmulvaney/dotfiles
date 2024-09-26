local map = vim.keymap.set

-- Open NetRw
map("n", "<leader>dv", vim.cmd.Ex)
map("n", "<leader>f", vim.lsp.buf.format)
map("n", "<C-s>", vim.cmd.write)

map("i", "jj", "<ESC>")

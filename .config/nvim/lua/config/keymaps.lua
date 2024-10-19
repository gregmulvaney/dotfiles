local map = vim.keymap.set

-- Open NetRw
map("n", "<leader>dv", vim.cmd.Oil)
-- Save
map("n", "<C-s>", vim.cmd.write)
map("n","<leader>f", vim.lsp.buf.format)

map("i", "jj", "<ESC>")

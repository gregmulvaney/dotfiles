local map = vim.keymap.set

-- Open NetRw
map("n", "<leader>dv", vim.cmd.Ex)
-- Save
map("n", "<C-s>", vim.cmd.write)

map("i", "jj", "<ESC>")

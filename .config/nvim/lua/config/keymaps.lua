local map = vim.keymap.set

-- Open NetRw/Oil
map("n", "<leader>dv", vim.cmd.Oil)
-- Save
map("n", "<C-s>", vim.cmd.write)
-- Normal mode
map("i", "jj", "<ESC>")

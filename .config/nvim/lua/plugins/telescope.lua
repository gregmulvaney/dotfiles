return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = {
                        "node_modules"
                    }
                }
            })
        end
    }
}

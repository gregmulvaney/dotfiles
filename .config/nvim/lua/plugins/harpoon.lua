return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        local map = vim.keymap.set
        map("n", "<leader>a", function()
            harpoon:list():add()
        end)
        map("n", "<leader>e", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        map("n", "<leader>h", function()
            harpoon:list():select(1)
        end)
        map("n", "<leader>j", function()
            harpoon:list():select(2)
        end)
        map("n", "<leader>k", function()
            harpoon:list():select(3)
        end)
        map("n", "<leader>l", function()
            harpoon:list():select(4)
        end)

        map("n", "<leader><C-h>", function()
            harpoon:list():replace_at(1)
        end)
        map("n", "<leader><C-j>", function()
            harpoon:list():replace_at(2)
        end)
        map("n", "<leader><C-k>", function()
            harpoon:list():replace_at(3)
        end)
        map("n", "<leader><C-l>", function()
            harpoon:list():replace_at(4)
        end)
    end,
}

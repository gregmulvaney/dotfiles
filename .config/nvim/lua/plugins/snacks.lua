return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = false },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        terminal = {
            win = {
                position = "float",
                backdrop = 60,
                border = "rounded",
                height = 0.8,
                width = 0.8,
                zindex = 50,
            },
        },
        win = { enabled = true }
    },
    keys = {
        {
            "<leader>tt",
            function()
                Snacks.terminal.toggle(cmd, opts)
            end,
            desc = "Terminal",
        },
        {
            "<leader>nt",
            function()
                Snacks.terminal.open(cmd, opts)
            end,
            desc = "New terminal"
        },
        {
            "<leader>lt",
            function()
                Snacks.terminal.list()
            end,
            desc = "List terminals"
        }
    },
}

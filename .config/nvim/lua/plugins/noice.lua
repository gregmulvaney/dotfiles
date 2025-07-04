return {
    "folke/noice.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            notify = {
                enabled = true,
                view = "notify",
            },
            lsp = {
                progress = {
                    enable = true,
                    format = "lsp_progress",
                    format_done = "lsp_progress_done",
                },
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                    ["vim.lsp.util.stylize_markdown"] = false,
                    ["cmp.entry.get_documentation"] = true,     -- requires hrsh7th/nvim-cmp
                },
            },
            message = {
                -- Messages shown by lsp servers
                enabled = true,
                view = "notify",
                opts = {},
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true,             -- use a classic bottom cmdline for search
                command_palette = true,           -- position the cmdline and popupmenu together
                long_message_to_split = true,     -- long messages will be sent to a split
                inc_rename = false,               -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false,           -- add a border to hover docs and signature help
            },
        })
    end,
}

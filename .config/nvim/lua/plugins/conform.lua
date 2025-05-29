return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatter_by_ft = {
                go = { "gofumpt", "goimports" },
                lua = { "stylua" },
                nix = { "nixfmt" },
            },
            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 500,
            }
        })

        vim.keymap.set({ "n" }, "<leader>f", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "format file" })

        vim.keymap.set({ "v" }, "<leader>f", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "format selection" })
    end
}

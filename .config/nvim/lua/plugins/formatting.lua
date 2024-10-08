return {
    'stevearc/conform.nvim',
    config = function()
        local conform = require("conform")

        conform.setup({
            default_format_opts = {
                lsp_format = "fallback"
            },
            formatters_by_ft = {
                python = {"black"},
                go = {
                    "gofumpt",
                    lsp_format = "fallback"
                }
            }
        })
    end,
    keys = {{"<leader>f", function()
        require("conform").format()
    end}}

}

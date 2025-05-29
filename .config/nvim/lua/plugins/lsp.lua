return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    opts = {
        codelens = {
            enabled = true,
        },
        servers = {
            gopls = {},
            lua_ls = {},
            nil_ls = {
                cmd = { "nil" },
            },
            ts_ls = {
                cmd = { "bunx", "typescript-language-server", "--stdio" },
            },
        }
    },
    config = function(_, opts)
        local lspconfig = require("lspconfig")

        local on_attach = function(client, bufnr) end

        for server, config in pairs(opts.servers) do
            config.on_attach = on_attach
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end

        require("mason").setup()
        require("mason-lspconfig").setup()
    end
}

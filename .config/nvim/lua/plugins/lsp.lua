return {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = {
        codelens = {
            enabled = true,
        },
        servers = {
            gopls = {},
            lua_ls = {},
            nil_ls = {
                cmd = { "nil" },
                formatter = {"alejandra"}
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
    end
}

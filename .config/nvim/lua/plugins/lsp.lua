return {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = {
        servers = {
            cssls = {},
            -- emmet_language_server = {
            --     cmd = { "emmet-language-server", "--stdio" },
            --     filetypes = { "html", "templ" },
            -- },
            html = {
                init_options = {
                    provideFormatter = false,
                },
            },
            gopls = {
                settings = {
                    gofumpt = true,
                    codelenses = {
                        gc_details = true,
                    },
                },
            },
            lua_ls = {},
            nil_ls = {
                cmd = { "nil" },
                filetypes = { "nix" },
                settings = {
                    ["nil"] = {
                        formatting = {
                            command = { "alejandra" },
                        },
                    },
                },
            },
            tailwindcss = {
                settings = {
                    tailwindCSS = {
                        experimental = {
                            configFile = "web/static/style.css"
                        },
                    }
                },
                workspace_required = true,
                root_dir = function(fname)
                    return vim.fs.dirname(vim.fs.find('.jj', { path = fname, upward = true })[1])
                end,
            },
            taplo = {},
            templ = {
                cmd = { "templ", "lsp" },
            },
            ts_ls = {},
            yamlls = {
                settings = {
                    yaml = {
                        schemas = {
                            ["https://json.schemastore.org/sqlc-2.0.json"] = "/*sqlc.yaml",
                        }
                    }
                }
            },
            zls = {},
        },
    },
    config = function(_, opts)
        local lspconfig = require("lspconfig")

        local on_attach = function(client, bufnr) end

        for server, config in pairs(opts.servers) do
            config.on_attach = on_attach
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            config.capabilities = vim.tbl_deep_extend("force", capabilities,
                require('blink.cmp').get_lsp_capabilities({}, false))
            lspconfig[server].setup(config)
        end
    end,
}

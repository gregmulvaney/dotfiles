return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- vim.api.nvim_create_autocmd("LspAttach", {
            --     group = vim.api.nvim_create_augroup("gregolas", { clear = true }),
            --     callback = function(event)
            --         local client = vim.lsp.get_client_by_id(event.data.client_id)
            --     end
            -- })
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            vim.filetype.add({ extension = { templ = "templ" } })
            capabilities = vim.tbl_deep_extend('force', capabilities, require("cmp_nvim_lsp").default_capabilities())
            capabilities.textDocument.completion.completionItem.snippetSupport = true


            local lspconfig = require("lspconfig")

            local servers = {
                gopls = {},
                html = {
                    filetypes = { "html", "templ" },
                    init_options = {
                        configurationSection = { "html", "css", "javascript" },
                        embeddedLanguages = {
                            css = true,
                            javascript = true
                        },
                        provideFormatter = false
                    },
                    single_file_support = true
                },
                htmx = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }
                            }
                        }
                    }
                },
                templ = {
                    cmd = { "/Users/gregmulvaney/.local/go/bin/templ", "lsp" },
                    filetypes = { "templ" },
                    root_dir = lspconfig.util.root_pattern("go.mod", ".git")
                },
                ts_ls = {
                    init_options = { host = "neovim" },
                    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "templ" }
                },
                unocss = {
                    filetypes = { "templ" }
                },
                zls = {},
            }
            vim.filetype.add({ extension = { templ = "templ" } })
            require("mason-tool-installer").setup({ vim.tbl_keys(servers) })
            -- Run Mason setup
            require("mason").setup()

            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                "rust_analyzer",
            })
            require("mason-lspconfig").setup {
                ensure_installed = ensure_installed,
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end
                }
            }
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                build = (function()
                    if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
                        return
                    end
                    return "make install_jsregexp"
                end)(),
                dependencies = {}
            },
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path"
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            luasnip.config.setup()

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                completion = { completeopt = "menu,menuone,noinsert" },
                mapping = cmp.mapping.preset.insert {
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<CR>'] = cmp.mapping.confirm { select = true },
                    ['<C-Space>'] = cmp.mapping.complete {},
                    ['<C-l>'] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        end
                    end, { 'i', 's' }),
                    ['<C-h>'] = cmp.mapping(function()
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        end
                    end, { 'i', 's' }),
                },
                sources = {
                    {
                        name = "lazydev",
                        group_index = 0,
                    },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" }
                }
            }
        end
    }
}

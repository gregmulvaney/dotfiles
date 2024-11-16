return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/nvim-cmp",
            "j-hui/fidget.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_lsp = require("cmp_nvim_lsp")

            local capabilities = cmp_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            local on_attach = function(client, bufnr) end

            local servers = {
                denols = {
                    root_dir = lspconfig.util.root_pattern("deno.lock"),
                    settings = {
                        deno = {
                            enable = true,
                            suggest = {
                                imports = {
                                    hosts = {
                                        ["https://jsr.io/"] = true,
                                    },
                                },
                            },
                        },
                    },
                },
                gopls = {
                    root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
                },
                html = {
                    filetypes = { "html", "templ" },
                    init_options = {
                        configurationSection = { "html", "css", "javascript" },
                        embeddedLanguages = {
                            css = true,
                            javascript = true,
                        },
                        provideFormatter = false,
                    },
                    single_file_support = true,
                },
                htmx = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                },
                templ = {
                    root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
                },
                ts_ls = {
                    cmd = { "typescript-language-server", "--stdio" },
                    init_options = {
                        hostInfo = "neovim",
                    },
                    single_file_support=false,
                    root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git"),
                },
                unocss = {},
                zls = {
                    root_dir = lspconfig.util.root_pattern("zls.json", "build.zig", ".git"),
                },
            }
            require("fidget").setup({})
            require("mason").setup()

            local ensure_installed = vim.tbl_keys(servers or {})
            require("mason-lspconfig").setup({
                ensure_installed = ensure_installed,
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        server.on_attach = on_attach
                        lspconfig[server_name].setup(server)
                    end,
                },
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
            luasnip.config.setup()
            luasnip.filetype_extend("javascript", { "jsdoc" })

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = { completeopt = "menu,menuone,noinsert" },
                mapping = cmp.mapping.preset.insert({
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete({}),
                    ["<C-l>"] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        end
                    end, { "i", "s" }),
                    ["<C-h>"] = cmp.mapping(function()
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        end
                    end, { "i", "s" }),
                }),
                sources = {
                    {
                        name = "lazydev",
                        group_index = 0,
                    },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                },
            })
        end,
    },
}

return {
	"neovim/nvim-lspconfig",
	lazy = false,
	opts = {
		codelens = {
			enabled = true,
		},
		servers = {
			emmet_ls = {
				cmd = { "bunx", "emmet-language-server", "--stdio" },
				filetypes = { "templ" },
			},
			gopls = {},
			lua_ls = {},
			nil_ls = {
				cmd = { "nil" },
				formatter = { "alejandra" },
			},
			tailwindcss = {
				cmd = { "bunx", "tailwindcss-language-server", "--stdio" },
			},
			templ = {
				cmd = { "templ", "lsp" },
			},
			ts_ls = {
				cmd = { "bunx", "typescript-language-server", "--stdio" },
				filetypes = { "ts", "js", "templ" },
			},
			zls = {},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")

		local on_attach = function(client, bufnr) end

		for server, config in pairs(opts.servers) do
			config.on_attach = on_attach
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}

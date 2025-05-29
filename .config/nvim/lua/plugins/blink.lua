return {
   'saghen/blink.cmp',
   lazy = false,
   -- optional: provides snippets for the snippet source
   dependencies = { 'rafamadriz/friendly-snippets' },
   build = 'cargo build --release',
   opts = {
       keymap = { 
           preset = 'default',
           ["<CR>"] = {'accept', 'fallback'}
       },
       completion = { documentation = { auto_show = false } },
       sources = {
           default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
           providers = {
               lazydev = {
                   name = "LazyDev",
                   module = "lazydev.integrations.blink",
                   -- make lazydev completions top priority (see `:h blink.cmp`)
                   score_offset = 100,
               },
           },
       },
       fuzzy = { implementation = "prefer_rust_with_warning" },
   },
   opts_extend = { "sources.default" }
}

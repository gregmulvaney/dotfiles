return {
    'saghen/blink.cmp',
    lazy = false,
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },
    build = 'cargo build --release',
    opts = {
        keymap = {
            preset = 'default',
            ["<CR>"] = { 'accept', 'fallback' }
        },
        completion = {
            documentation = { auto_show = true },
            menu = {
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label",      gap = 1 },
                        { "source_name" },
                    },
                },
            },
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "rust" },
        signature = { enabled = true },
    },
    opts_extend = { "sources.default" }
}

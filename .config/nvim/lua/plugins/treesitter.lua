return {
    "nvim-treesitter/nvim-treesitter",
    build = { ":TSUpdate" },
    -- event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({
            sync_install = false,
            auto_install = true,
            ensure_installed = {
                "vim",
                "vimdoc",
                "zig",
                "rust",
                "go"
            },
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            }
        })
    end
}

return {
    "nvim-treesitter/nvim-treesitter",
    build = { ":TSUpdate" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "vim",
                "vimdoc",
                "go",
                "rust"
            },
            sync_install = false,
            auto_install = true,
            indent = {
                enable = true
            },
            highlight = {
                enable = true
            },
        })
    end
}

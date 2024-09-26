return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = { ":TSUpdate" },
    event = { "BufReadPost", "BufNewFile" },
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    config = function()
      require("nvim-treesitter.configs").setup({
        sync_install = false,
        auto_install = true,
        ensure_installed = {
          "c",
          "go",
          "lua",
          "rust",
          "typescript",
          "yaml",
          "zig",
        },
        highlight = {
          enable = true,
          ---additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true
        },
      })
    end
  },
}

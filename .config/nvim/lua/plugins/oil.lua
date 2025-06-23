return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        default_file_explorer = true
    },
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
        require("oil").setup {
            view_options = {
                show_hidden = true,
                is_always_hidden = function(name)
                    local hidden_files = { ".direnv", ".git", ".jj" }
                    local m = vim.tbl_contains(hidden_files, name)
                    return m
                end
            }
        }
    end
}

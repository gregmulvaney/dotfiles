return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        dependencies = {
            "HiPhish/rainbow-delimiters.nvim",
            config = function()
                require('rainbow-delimiters.setup').setup()
            end
        },
        config = function()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }

            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#f38ba8" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#f9e2af" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#89b4fa" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#fab387" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#a6e3a1" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#cba6f7" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#74c7ec" })
            end)
            vim.g.rainbow_delimiters = { highlight = highlight }
            require("ibl").setup {
                scope = {
                    highlight = highlight,
                }
            }
            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    }
}

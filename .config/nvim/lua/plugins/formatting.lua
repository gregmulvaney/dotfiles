return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main   = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        config = function()
            require("ibl").setup()
        end
    }
}

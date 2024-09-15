if vim.loader then
    vim.loader.enable()
end
vim.lsp.set_log_level("debug")

require("config.lazy")

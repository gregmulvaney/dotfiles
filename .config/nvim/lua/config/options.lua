vim.g.mapleader = " "
vim.g.localmapleader = "\\"

-- Line numbers
vim.opt.nu = true
vim.opt.smartindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Hide cmd line
-- vim.opt.cmdheight = 0

-- Disable line wrapping
vim.opt.wrap = false
-- Disable swapfile
vim.opt.swapfile = false
-- vim.opt.undodir = os.getenv("XDG_CACHE_HOME") .. "/nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

-- NetRW options
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25


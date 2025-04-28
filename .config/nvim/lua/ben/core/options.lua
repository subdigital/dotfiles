local opt = vim.opt

-- line numbers
opt.number = true

-- tabs/indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
-- show sign column always so text doesn't shift when it is added
opt.signcolumn = "yes"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- turn off swapfile
opt.swapfile = false

-- disable commandline until it is used
vim.opt.cmdheight = 0

-- preserve undo across sessions
vim.opt.undofile = true

-- show whitespace chars
vim.opt.list = true
vim.opt.listchars = { tab = "≫ ", trail = "･", nbsp = "␣" }

-- preview substitutions as you type
vim.opt.incsearch = true

-- don't show the mode, it's already visible in the status line
-- vim.opt.showmode = false

-- start scrolling earlier
vim.opt.scrolloff = 10

---@diagnostic disable: undefined-global

vim.cmd("let g:netrw_banner = 0")

-- disable welcome message
vim.opt.shortmess:append("I")

-- change cursor for insert mode
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" ..
    ",a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor" ..
    ",sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- system yank buffer
vim.opt.clipboard:append("unnamedplus")

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = "≫ ", trail = "･", nbsp = "␣" }

-- preview substitutions as you type
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- start scrolling earlier
vim.opt.scrolloff = 10

vim.opt.updatetime = 50

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "210"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"

-- backspace behavior (this is probably the default??)
vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.mouse = "a"
vim.editorconfig = true

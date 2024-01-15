vim.g.mapleader = " "

local km = vim.keymap

-- clear search highlights
km.set("n", "<cr>", "<cmd>nohl<cr>", { silent = true })

-- window navigation
km.set("n", "<c-l>", "<c-w>l")
km.set("n", "<c-h>", "<c-w>h")
km.set("n", "<c-k>", "<c-w>k")
km.set("n", "<c-j>", "<c-w>j")

-- tab navigation
km.set("n", "<s-l>", "<cmd>tabn<cr>")
km.set("n", "<s-h>", "<cmd>tabp<cr>")

-- quick open config
km.set("n", "<leader>V", ":tabe ~/.config/nvim/init.lua<cr>:Lazy load neo-tree.nvim<cr>:Neotree reveal left reveal_force_cwd<cr>")

-- close buffer
km.set("n", "<leader>bc", "<cmd>bdelete<cr>", { noremap = true, silent = true })

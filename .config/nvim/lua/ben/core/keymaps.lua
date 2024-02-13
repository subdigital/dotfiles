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
--
km.set("n", "<leader>V", ":tabe ~/.config/nvim/init.lua<cr>:Lazy load neo-tree.nvim<cr>:Neotree reveal left reveal_force_cwd<cr>", { desc = "Quick open nvim config" })

-- close buffer
km.set("n", "<leader>bc", "<cmd>bdelete<cr>", { noremap = true, silent = true })

-- easier saving/quitting
km.set("n", "<leader>w", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save"})
km.set("n", "<leader>q", "<cmd>q<cr>", { noremap = true, silent = true, desc = "Quit"})
km.set("n", "<leader>wq", "<cmd>wq<cr>", { noremap = true, silent = true, desc = "Quit"})

-- find/replace in current buffer (for project wide, look in spectre.lua)
km.set("n", "S", function()
  local cmd = ":%s/<c-r><c-w>/<c-r><c-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end)

-- center buffer while vertical scrolling
km.set("n", "<c-u>", "<c-u>zz", { silent = true, noremap = true })
km.set("n", "<c-d>", "<c-d>zz", { silent = true, noremap = true })
km.set("n", "G", "Gzz", { silent = true, noremap = true })

-- move selection up and down
km.set("x", "<a-j>", ":m '>+1<cr>gv=gv", { silent = true, noremap = true })
km.set("x", "<a-k>", ":m '<-2<cr>gv=gv", { silent = true, noremap = true })

-- move line up and down
km.set("n", "<a-k>", ":m .-2<cr>==", { silent = true, noremap = true })
km.set("n", "<a-j>", ":m .+1<cr>==", { silent = true, noremap = true })

-- keep selection while indenting
km.set("v", ">", ">gv", { silent = true, noremap = true })
km.set("v", "<", "<gv", { silent = true, noremap = true })

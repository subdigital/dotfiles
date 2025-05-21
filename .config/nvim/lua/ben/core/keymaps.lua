vim.g.mapleader = " "

local km = vim.keymap

-- clear search highlights
km.set("n", "<c-n>", "<cmd>nohl<cr>", { silent = true, noremap = true })

-- window navigation
km.set("n", "<c-l>", "<c-w>l", { noremap = true, silent = true })
km.set("n", "<c-h>", "<c-w>h", { noremap = true, silent = true })
km.set("n", "<c-k>", "<c-w>k", { noremap = true, silent = true })
km.set("n", "<c-j>", "<c-w>j", { noremap = true, silent = true })


-- tab navigation
km.set("n", "<s-l>", "<cmd>tabn<cr>", { noremap = true, silent = true })
km.set("n", "<s-h>", "<cmd>tabp<cr>", { noremap = true, silent = true })

-- quick open config
--
km.set(
  "n",
  "<leader>V",
  ":tabe ~/.config/nvim/init.lua<cr>:Lazy load neo-tree.nvim<cr>:Neotree reveal left reveal_force_cwd<cr>",
  { desc = "Quick open nvim config" }
)

-- close buffer
km.set("n", "<leader>bc", "<cmd>bdelete<cr>", { noremap = true, silent = true })

-- easier saving/quitting
km.set("n", "<leader>w", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save" })
km.set("n", "<leader>q", "<cmd>q<cr>", { noremap = true, silent = true, desc = "Quit" })
km.set("n", "<leader>wq", "<cmd>wq<cr>", { noremap = true, silent = true, desc = "Quit" })

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

-- go to file in previous window

-- this function but in lua
--  map <F8> :let mycurf=expand("<cfile>")<cr><c-w> w :execute("e ".mycurf)<cr><c-w>p
--

M = {}
function M.open_file_new_window()
  -- get the file under the cursor
  local cur_file = vim.fn.expand("<cfile>")

  -- save the current window id
  -- local cur_win = vim.api.nvim_get_current_win()

  -- switch to the previous window
  vim.api.nvim_command("wincmd p")
  vim.api.nvim_command("edit" .. cur_file)

  -- switch back?
  -- vim.api.nvim_set_current_win(cur_win)
end

km.set("n", "<F8>", [[:lua M.open_file_new_window()<cr>]], { silent = true, noremap = true })

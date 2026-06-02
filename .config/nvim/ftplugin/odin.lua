local opt = vim.opt

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4

vim.api.nvim_set_keymap("n", "<D-r>", "!mise r run<cr>", { silent = false })
vim.api.nvim_set_keymap("n", "<D-b>", "!mise r build<cr>", { silent = false })

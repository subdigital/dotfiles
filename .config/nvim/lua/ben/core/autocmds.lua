-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "Dangerfile,Podfile,Gemfile,Fastfile,Appfile,Vagrantfile,Thorfile,config.ru,*.podspec,Guardfile,Capfile,*.cap,*.rabl,",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(buf, "filetype", "ruby")
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "justfile",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(buf, "filetype", "make")
  end,
})

-- open neotree automatically if you specify a folder
vim.api.nvim_create_augroup("neotree", {})
vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Open Neotree automatically",
  group = "neotree",
  callback = function()
    local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0)) 
    if stats and stats.type == "directory" then
      require("neo-tree.setup.netrw").hijack()
    end 
  end
})

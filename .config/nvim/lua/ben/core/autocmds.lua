-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- set ruby filetypes for ruby files that don't have an extension
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "Dangerfile,Podfile,Gemfile,Fastfile,Appfile,Vagrantfile,Thorfile,config.ru,*.podspec,Guardfile,Capfile,*.cap,*.rabl,",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_set_option_value("filetype", "ruby", { buf = buf })
  end,
})

-- set bazel file types
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "BUILD.*",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(buf, "filetype", "bzl")
  end,
})

-- zig files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "build.zig",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(buf, "filetype", "zig")
  end,
})

-- just files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "justfile",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_set_option_value("filetype", "make", { buf = buf })
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
  end,
})

-- automatically reload files when they change
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "if mode() !~ '\v(c|r.?!|t)' && getcmdwintype() == '' | checktime | endif",
})

-- notify w/ a message when this happens
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  pattern = "*",
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
})

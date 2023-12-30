local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
    size = 20,
    open_mapping = [[<leader>`]],
    hide_numbers = true,
    shade_filetypes = {},
    shading_factor = 2,
    start_in_insert = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 08,
      highlights = {
          border = "Normal",
          background = "Normal"
      }
    }
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
local Terminal = require('toggleterm.terminal').Terminal


return {
  "folke/which-key.nvim",
  dependencies = {
    "echasnovski/mini.icons"
  },
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    win = {
      border = "double", -- none, single, double, shadow
      -- position = "bottom", -- bottom, top
      -- margin = { 0.2, 0.2, 0.2, 0.2 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
      padding = { 3, 5, 3, 5 }, -- extra window padding [top, right, bottom, left]
      wo = {
        winblend = 25, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      },
      zindex = 1000, -- positive value to position WhichKey above other floating windows.
    },
  },
}

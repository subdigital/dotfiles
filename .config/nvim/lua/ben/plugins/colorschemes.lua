return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      --vim.cmd([[colorscheme tokyonight]])
    end
  },
  {
    "bluz71/vim-nightfly-colors",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd([[colorscheme nightfly]])
    end
  },
  {
    "bluz71/vim-moonfly-colors",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd([[colorscheme moonfly]])
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin-mocha]])
      -- vim.cmd([[colorscheme catppuccin-latte]])
      -- vim.cmd([[colorscheme catppuccin-frappe]])
      -- vim.cmd([[colorscheme catppuccin-macchiato]])
    end
  }
}

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
    "catppuccin/vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin_mocha]])
      -- vim.cmd([[colorscheme catppuccin_latte]])
      -- vim.cmd([[colorscheme catppuccin_frappe]])
      -- vim.cmd([[colorscheme catppuccin_macchiato]])
    end
  }
}

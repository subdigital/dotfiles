return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        compile = true,
        transparent = true,
        theme = "dragon",
      })
      vim.cmd([[colorscheme kanagawa]])
    end,
    build = function()
      vim.cmd("KanagawaCompile")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "bluz71/vim-nightfly-colors",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd([[colorscheme nightfly]])
    end,
  },
  {
    "bluz71/vim-moonfly-colors",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd([[colorscheme moonfly]])
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd([[colorscheme catppuccin-mocha]])
      -- vim.cmd([[colorscheme catppuccin-latte]])
      -- vim.cmd([[colorscheme catppuccin-frappe]])
      -- vim.cmd([[colorscheme catppuccin-macchiato]])
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      require("transparent").setup({
        exclude_groups = { "NotifyBackground" },
      })
    end,
  },
}

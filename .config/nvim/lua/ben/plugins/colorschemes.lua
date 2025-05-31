return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        compile = true,
        transparent = true,
        theme = "dragon",
      })
      --vim.cmd([[colorscheme kanagawa]])
    end,
    build = function()
      -- vim.cmd("KanagawaCompile")
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
  {
    "lunacookies/vim-colors-xcode",
    config = function() end,
  },

  {
    "https://github.com/RRethy/base16-nvim",
    config = function()
      local bg = "#0F1919"
      local accent = "#102121"
      local accent2 = "#0D2525" -- highlight

      local text = "#abb2bf"
      local dark_text = "#3E4451" -- comments, line numbers

      local keyword = "#8F939A"
      local func = "#B6AB8B"
      local types = "#65838E"
      local constant = "#A06057"

      local for_tesing = "#FF0000"

      require("base16-colorscheme").setup({
        base00 = bg,
        base01 = accent,
        base02 = accent2,
        base03 = dark_text,
        base04 = dark_text,
        base05 = text,
        base06 = for_tesing,
        base07 = for_tesing,
        base08 = text,
        base09 = constant,
        base0A = types,
        base0B = constant,
        base0C = text,
        base0D = func,
        base0E = keyword,
        base0F = text,
      })
      -- vim.cmd([[colorscheme base16]])
    end,
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "ruby",
      "swift",
      "svelte",
      "tsx",
      "typescript",
      "vim",
      "yaml",
      "zig",
    },
    indent = {
      -- enabled = true
      enabled = false,
    },
    highlight = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      -- keymaps = {
      --   init_selection = "gnn",
      --   node_incremental = "grn",
      --   scope_incremental = "grc",
      --   node_decremental = "grm",
      -- }
      keymaps = {
        init_selection = "<enter>",
        node_incremental = "<enter>",
        scope_incremental = false,
        node_decremental = "<Backspace>",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  end,
  build = ":TSUpdate",
}

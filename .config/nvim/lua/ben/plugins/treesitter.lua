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
      "tsx",
      "typescript",
      "vim",
      "yaml",
    },
    indent = {
      enabled = true
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      }
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  end,
  build = ":TSUpdate"
}

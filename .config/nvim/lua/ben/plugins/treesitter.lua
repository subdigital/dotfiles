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
  },
  build = ":TSUpdate"
}

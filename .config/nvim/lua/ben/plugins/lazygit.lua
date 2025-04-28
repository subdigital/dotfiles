return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    { "<leader>G", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit Current File" },
  },
}

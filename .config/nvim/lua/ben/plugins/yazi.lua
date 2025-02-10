return {
  "mikavilpas/yazi.nvim",
  keys = {
    {
      "<leader>-",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file"
    },
    {
      "<leader>cw",
      mode = { "n", "v" },
      "<cmd>Yazi cwd<cr>",
      desc = "Open yazi at the current working directory"
    }
  },
  opts = {
    keymaps = {
      change_working_directory = "<c-.>"
    }
  },
}

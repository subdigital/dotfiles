return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files" },
    {
      "<leader>FF",
      function()
        require("telescope.builtin").find_files({ hidden = true })
      end,
      desc = "find files (+hidden)",
    },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "search text" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "find buffer" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "search help" },
  },
}

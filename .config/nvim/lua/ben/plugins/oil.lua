return {
  "stevearc/oil.nvim",
  enabled = false,
  opts = {
    -- don't override neo tree
    default_file_explorer = false
  },
  keys = {
    { "<leader>o", "<cmd>Oil --float<cr>", desc = "Open floating file finder" },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function(opts)
    require("oil").setup(opts)
  end
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
    "3rd/image.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree", silent = true },
    { "<leader>j", "<cmd>Neotree filesystem reveal left reveal_file=%<cr>", desc = "Reveal file NeoTree", silent = true },
  },
  config = function()
    require("neo-tree").setup()
  end
}

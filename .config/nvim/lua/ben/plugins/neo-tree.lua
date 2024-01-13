return { 
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    { "<leader>j", "<cmd>Neotree filesystem reveal left reveal_file=%<cr>", desc = "Reveal file NeoTree" },
  },
  config = function()
    require("neo-tree").setup()
  end
}

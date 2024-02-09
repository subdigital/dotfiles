return {
  -- project side search and replace
  "nvim-pack/nvim-spectre",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "catppuccin/nvim"
  },
  keys = {
    { "<leader>S", "<cmd>lua require('spectre').toggle()<cr>", desc = "Project wide search", mode = "n" },
    { "<leader>sw", "<cmd>lua require('spectre').open_visual({ select_word = true })<cr>", desc = "Sarch current word", mode = "n" },
    { "<leader>sw", "<cmd>lua require('spectre').open_visual()<cr>", desc = "Search current word", mode = "v" },
    { "<leader>sf", "<cmd>lua require('spectre').open_file_search({ select_word = true })<cr>", desc = "Search in current file", mode = "v" },
  },
  config = function()
    local theme = require("catppuccin.palettes").get_palette("mocha")

    vim.api.nvim_set_hl(0, "SpectreSearch", { bg = theme.red, fg = theme.base })
    vim.api.nvim_set_hl(0, "SpectreReplace", { bg = theme.green, fg = theme.base })

    require("spectre").setup({
      highlight = {
        search = "SpectreSearch",
        replace = "SpectreReplace",
      },
      mapping = {
        ["send_to_qf"] = {
          map = "<c-q>",
          cmd = "<cmd>lua require('spectre.actions').send_to_qf()<cr>",
          desc = "Send all items to quickfix"
        }
      }
    })
  end
}

return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Trouble diagnostics"
    },
    {
      "<leader>xb",
      "<cmd>Trouble diagnostics_buffer toggle<cr>",
      desc = "Buffer diagnostics"
    }
    -- { "<leader>xq", function() require("trouble").toggle("quickfix") end, desc = "Quickfix" },
    -- { "<leader>xl", function() require("trouble").toggle("loclist") end, desc = "loclist" },
    -- { "<leader>xr", function() require("trouble").toggle("lsp_references") end, desc = "LSP References" },
  },
  opts = {
    modes = {
      diagnostics_buffer = {
        mode = "diagnostics",
        filter = { buf = 0 }
      }
    }
  }
}

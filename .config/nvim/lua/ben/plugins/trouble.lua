return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  keys = {
    { "<leader>xx", function() require("trouble").toggle() end, desc = "Trouble toggle" },
    { "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, desc = "Workspace diagnostics" },
    { "<leader>xb", function() require("trouble").toggle("document_diagnostics") end, desc = "Buffer diagnostics" },
    { "<leader>xq", function() require("trouble").toggle("quickfix") end, desc = "Quickfix" },
    { "<leader>xl", function() require("trouble").toggle("loclist") end, desc = "loclist" },
    { "<leader>xr", function() require("trouble").toggle("lsp_references") end, desc = "LSP References" },
  },
  opts = {

  }
}

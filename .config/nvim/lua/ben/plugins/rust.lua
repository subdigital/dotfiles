return {
  "mrcjkb/rustaceanvim",
  version = "^4",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
    "lvimuser/lsp-inlayhints.nvim",
  },
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      tools = {
        hover_actions = {
          auto_focus = true
        }
      },
      server = {
        on_attach = function(client, bufnr)
          require("lsp-inlayhints").on_attach(client, bufnr)
        end
      }
    }
  end
}

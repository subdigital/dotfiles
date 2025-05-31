return {
  "azorng/goose.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        anti_conceal = { enabled = false },
      },
    },
  },
  config = function()
    require("goose").setup({
      default_global_keymaps = false,
      keymap = {
        global = {
          toggle = "<leader>CC",
          open_input = "<leader>CI",
          open_output = "<leader>CO",
        },
      },
    })
  end,
}
